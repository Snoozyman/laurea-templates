#!/usr/bin/env bash
#
# Install laurea-templates as a local Typst package.
#
# Supports Linux and macOS. Running the script again re-copies the current
# files into the package directory, so it also serves as an update.
#
# Usage:
#   bash scripts/install.sh               # install or update
#   bash scripts/install.sh --where       # print the install path and exit
#   bash scripts/install.sh --uninstall   # remove the installed package version
#   bash scripts/install.sh --prefix DIR  # override the data directory (testing)
#
set -euo pipefail

PACKAGE_NAME="laurea-templates"
NAMESPACE="local"
UNINSTALL=0
WHERE=0
DATA_DIR=""

usage() {
  sed -n '2,16p' "$0"
  exit "${1:-0}"
}

# Resolve the real location of this script (following symlinks).
SCRIPT_SRC="${BASH_SOURCE[0]}"
while [ -L "$SCRIPT_SRC" ]; do
  SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_SRC")" && pwd)"
  SCRIPT_SRC="$(readlink "$SCRIPT_SRC")"
  case "$SCRIPT_SRC" in
    /*) ;;
    *) SCRIPT_SRC="$SCRIPT_DIR/$SCRIPT_SRC" ;;
  esac
done
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_SRC")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --where) WHERE=1 ;;
    --uninstall) UNINSTALL=1 ;;
    --prefix)
      [ "$#" -ge 2 ] || { echo "error: --prefix requires a directory" >&2; usage 1; }
      DATA_DIR="$2"
      shift
      ;;
    -h | --help) usage ;;
    *) echo "error: unknown option: $1" >&2; usage 1 ;;
  esac
  shift
done

# Read the package version from typst.toml.
VERSION="$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' "$REPO_ROOT/typst.toml" | head -n 1)"
if [ -z "$VERSION" ]; then
  echo "error: could not read the version from $REPO_ROOT/typst.toml" >&2
  exit 1
fi

if [ -z "$DATA_DIR" ]; then
  case "$(uname -s)" in
    Darwin) DATA_DIR="$HOME/Library/Application Support" ;;
    Linux) DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}" ;;
    *)
      echo "error: unsupported platform: $(uname -s) (only Linux and macOS are supported)" >&2
      exit 1
      ;;
  esac
fi

PACKAGES_DIR="$DATA_DIR/typst/packages"
VERSION_DIR="$PACKAGES_DIR/$NAMESPACE/$PACKAGE_NAME/$VERSION"

# Refuse to touch anything outside the typst packages tree.
case "$VERSION_DIR" in
  "$PACKAGES_DIR"/"$NAMESPACE"/"$PACKAGE_NAME"/*) ;;
  *)
    echo "error: refusing to operate on $VERSION_DIR (outside the typst packages tree)" >&2
    exit 1
    ;;
esac

if [ "$WHERE" -eq 1 ]; then
  echo "$VERSION_DIR"
  exit 0
fi

if [ "$UNINSTALL" -eq 1 ]; then
  if [ -e "$VERSION_DIR" ]; then
    rm -rf "$VERSION_DIR"
    echo "Removed $VERSION_DIR"
  else
    echo "Nothing installed at $VERSION_DIR"
  fi
  exit 0
fi

# Install / update.
for required in "typst.toml" "src/lib.typ" "template/main.typ"; do
  if [ ! -e "$REPO_ROOT/$required" ]; then
    echo "error: missing $REPO_ROOT/$required — run the script from the repository root" >&2
    exit 1
  fi
done

rm -rf "$VERSION_DIR"
mkdir -p "$VERSION_DIR"

for entry in "typst.toml" "src" "template" "LICENSE" "README.md" "thumbnail.png"; do
  if [ -e "$REPO_ROOT/$entry" ]; then
    cp -R "$REPO_ROOT/$entry" "$VERSION_DIR/"
  fi
done

# Keep the scaffolded template imports pinned to the installed version, so
# `typst init @local/laurea-templates:$VERSION` always produces a compiling
# project even after a version bump.
for t in "$VERSION_DIR"/template/*.typ; do
  [ -e "$t" ] || continue
  sed -i.bak \
    -e "s#@\(local\|preview\)/laurea-templates:[0-9]\+\.[0-9]\+\.[0-9]\+#@local/laurea-templates:$VERSION#g" \
    "$t" 2>/dev/null || true
  rm -f "$t.bak"
done

if ! command -v typst >/dev/null 2>&1; then
  echo "warning: 'typst' was not found on PATH — install it from https://typst.app" >&2
fi

echo "Installed laurea-templates $VERSION to:"
echo "  $VERSION_DIR"
echo
echo "Use it in any document:"
echo "  #import \"@local/laurea-templates:$VERSION\": thesis, appendix"
echo "Or scaffold a new project:"
echo "  typst init @local/laurea-templates:$VERSION my-thesis"
echo
echo "Check for updates later by re-running this script."