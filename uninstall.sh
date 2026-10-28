#!/usr/bin/env bash
set -euo pipefail
for rc in "$HOME/.zshrc" "$HOME/.bashrc" "$HOME/.bash_profile"; do
  [ -f "$rc" ] && sed -i.bak '/# dotaliases$/d' "$rc" && rm -f "$rc.bak"
done
rm -rf "${DOTALIASES_DIR:-$HOME/.dotaliases}"
echo "Removed dotaliases."
