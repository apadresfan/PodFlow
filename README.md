# PodFlow Web
A static, responsive podcast player. No npm, build process, API keys or server required for the app shell.

## GitHub Pages
1. Create a GitHub repository, e.g. `podflow`.
2. Upload the **contents** of this folder to the root of the repository, including `.nojekyll`.
3. In Settings > Pages, select Deploy from a branch, `main`, `/ (root)`, Save.
4. Open the Pages URL shown by GitHub. On iPhone use Safari Share > Add to Home Screen; installation on other browsers depends on their PWA support.

## Use
Discover searches Apple's public directory. Add RSS URLs directly, or import OPML from Settings. If feeds do not grant cross-origin access (CORS), GitHub Pages cannot bypass that restriction. The optional proxy setting is only used for public directory feeds; configure a trusted proxy that returns raw RSS and allows your Pages origin. Private feeds are fetched directly and work only if the server allows browser access. URLs and library data are saved locally; do not share backups containing private feed tokens. Direct audio URLs and local audio files are alternative playback sources. Browser autoplay policies may require tapping Play again.

Playback includes speed 0.5–3x (0.05 steps), browser pitch preservation, custom skips, sleep timers, queue, per-show intro/outro/speed/retention, manual feed refresh with new-episode queue rules, episode filters, OPML, bookmarks, creator-provided JSON chapters and supported transcripts, sanitized show notes with timestamp links, Media Session controls where supported, driving mode and local resume. Offline audio is stored in IndexedDB when the audio server allows CORS; browser storage quotas and eviction apply. Wi-Fi prefetch only runs when the browser exposes a Wi-Fi connection type. Cleanup and timers run while the page is active; suspended mobile pages may delay them. App shell caches after first successful visit. Backup/restore moves metadata, not audio.

Not implemented: smart silence removal, voice leveling, cloud synchronization, native CarPlay/Android Auto, automatic speech recognition, automatic transcript highlighting, clip export, shake-to-extend, ID3 chapters, and background refresh/download. These require further development and/or native/backend services. No hosted backend is included. JavaScript syntax checked with Node; browser/device and live feed behavior have not been end-to-end verified.
