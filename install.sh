#!/usr/bin/env bash
# Install aliases for bash/zsh on macOS or Linux.
#   curl -fsSL https://raw.githubusercontent.com/vinayakdev/dotaliases/main/install.sh | bash
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/vinayakdev/dotaliases/main"
DEST_DIR="${DOTALIASES_DIR:-$HOME/.dotaliases}"
DEST="$DEST_DIR/aliases.sh"
MARK="# dotaliases"
LINE="[ -f \"$DEST\" ] && source \"$DEST\" $MARK"

mkdir -p "$DEST_DIR"

# Use local file when run from a clone, otherwise download.
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [ -n "$SRC_DIR" ] && [ -f "$SRC_DIR/aliases.sh" ]; then
  cp "$SRC_DIR/aliases.sh" "$DEST"
else
  curl -fsSL "$REPO_RAW/aliases.sh" -o "$DEST"
fi

added=0
add_to() {
  local rc="$1"
  [ -f "$rc" ] || return 0
  if ! grep -qF "$MARK" "$rc"; then
    printf '\n%s\n' "$LINE" >> "$rc"
    echo "Added source line to $rc"
  fi
  added=1
}

add_to "$HOME/.zshrc"
add_to "$HOME/.bashrc"
[ "$(uname)" = "Darwin" ] && add_to "$HOME/.bash_profile"

if [ "$added" -eq 0 ]; then
  # No rc file found: create one for the user's shell.
  case "${SHELL:-}" in
    *zsh*) touch "$HOME/.zshrc"; add_to "$HOME/.zshrc" ;;
    *)     touch "$HOME/.bashrc"; add_to "$HOME/.bashrc" ;;
  esac
fi

echo "Installed to $DEST. Restart your shell or run: source $DEST"
