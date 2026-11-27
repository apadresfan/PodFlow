#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  set +u
  source "$HOME/.nvm/nvm.sh"
  set -u
fi
echo "Updating PodFlow..."
if [[ -n "$(git status --porcelain --untracked-files=no)" ]]; then
  echo "Tracked files have local changes. Commit or save them before updating."
  exit 1
fi
if [[ "$(git branch --show-current)" != main ]]; then
  echo "Please switch to the main branch before updating."
  exit 1
fi
git pull --ff-only origin main
bash native/build-ios.command
echo "Ready. Select your iPhone in Xcode and press Run."
