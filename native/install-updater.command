#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
ROOT="$(pwd -P)"
APP_DIR="$HOME/Applications"
APP="$APP_DIR/PodFlow Updater.app"
mkdir -p "$APP_DIR"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
# Encode the path for an AppleScript string literal.
ESCAPED="$(printf '%s' "$ROOT/native/update-ios.command" | sed 's/\\/\\\\/g;s/"/\\"/g')"
cat > "$TMP/updater.applescript" <<EOF
on run
    set updaterPath to "$ESCAPED"
    tell application "Terminal"
        activate
        do script ("bash " & quoted form of updaterPath & " || echo 'PodFlow update failed. See the message above.'")
    end tell
end run
EOF
osacompile -o "$TMP/PodFlow Updater.app" "$TMP/updater.applescript"
if [[ -e "$APP" ]]; then
  mv "$APP" "$TMP/Previous.app"
fi
if ! mv "$TMP/PodFlow Updater.app" "$APP"; then
  if [[ -e "$TMP/Previous.app" ]]; then mv "$TMP/Previous.app" "$APP"; fi
  exit 1
fi
echo "Installed: $APP"
open -R "$APP"
