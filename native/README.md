# PodFlow 3.0 — personal iPhone build

This folder packages the existing website locally with Capacitor 8. The public website is unchanged. It is a starter build, not a signed IPA.

## Requirements
- A Mac supporting Xcode 26 or later (full Xcode, not just command-line tools).
- Node.js 22 or later.
- An Apple Account; free personal signing is sufficient for testing on your own iPhone.

## First build
In Terminal at the repository root:
```sh
bash native/build-ios.command
```
This prepares bundled files, installs dependencies, generates the iOS project, applies the existing icon and opens Xcode. The generated project and npm lockfile remain on your Mac.

## Install
1. Connect and unlock your iPhone. Trust the Mac if prompted.
2. In Xcode Settings > Accounts add your Apple Account.
3. Select App target > Signing & Capabilities, enable Automatically manage signing, select your Personal Team. If the bundle identifier conflicts, change it to a unique value and preserve it for future builds.
4. Select your iPhone in the device selector. Enable Developer Mode on the iPhone if prompted (Settings > Privacy & Security > Developer Mode, then restart and confirm).
5. Press Run. Follow any signing or trust prompts.
6. Free personal provisioning generally expires after seven days. Rebuild/run using the same bundle identifier and team; do not uninstall to avoid losing local data.

## Updates
Run git pull from the repository root, then bash native/build-ios.command again. Keep the same generated project, bundle identifier and signing team.

## Data and limitations
Export a backup from the website Settings, save to Files, and import it in the installed app. Backups contain library and listening data, not downloaded audio or IndexedDB transcripts; redownload and regenerate as needed. Private RSS URLs can be sensitive.
The web interface and assets are bundled, so startup does not need a server. Browser-style audio, IndexedDB, CORS, AI models and media controls still require device testing in WKWebView. Native background playback, CarPlay, native filesystem downloads and iCloud are not implemented. Do not assume the web version's service worker works in the native container. The dashboard treats the bundled shell as available but audio must be downloaded separately. No signing or physical-device tests have been completed here.
