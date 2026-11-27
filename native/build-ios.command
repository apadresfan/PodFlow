#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
if [[ "$(uname -s)" != Darwin ]]; then echo "This script needs a Mac."; exit 1; fi
if ! command -v node >/dev/null || ! command -v npm >/dev/null; then echo "Install Node.js 22 or newer from https://nodejs.org/"; exit 1; fi
if [[ "$(node -p 'Number(process.versions.node.split(".")[0])')" -lt 22 ]]; then echo "Node.js 22 or newer is required."; exit 1; fi
XCODE="$(xcodebuild -version 2>/dev/null)" || { echo "Install and open full Xcode, accept its license, and select it in Xcode Settings > Locations."; exit 1; }
MAJOR="$(printf '%s\n' "$XCODE" | awk '/^Xcode / {split($2,v,"."); print v[1]}')"
if [[ -z "$MAJOR" || "$MAJOR" -lt 26 ]]; then echo "Capacitor 8 requires Xcode 26 or newer."; exit 1; fi
npm install
npm run build
if [[ ! -d ios ]]; then npx cap add ios; fi
npx cap sync ios
ICON_DIR="ios/App/App/Assets.xcassets/AppIcon.appiconset"
if [[ -d "$ICON_DIR" ]]; then
  sips -s format png -z 1024 1024 ../podflow-icon-512.png --out "$ICON_DIR/AppIcon-1024.png" >/dev/null
  node --input-type=module -e 'import fs from "node:fs";fs.writeFileSync(process.argv[1],JSON.stringify({images:[{filename:"AppIcon-1024.png",idiom:"universal",platform:"ios",size:"1024x1024"}],info:{author:"xcode",version:1}},null,2))' "$ICON_DIR/Contents.json"
fi
npx cap open ios
echo "In Xcode select your personal Team and iPhone, then click Run."
