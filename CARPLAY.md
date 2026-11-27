# PodFlow and Apple CarPlay

The web app publishes Media Session metadata and transport actions for compatible system and vehicle controls. It cannot register a CarPlay dashboard application. Support varies by iOS/browser/vehicle. Test while parked.

## Native integration prerequisites
1. Enroll in the Apple Developer Program and request CarPlay Audio entitlement at https://developer.apple.com/contact/carplay.
2. Create a native iOS audio app with AVPlayer, AVAudioSession playback category, background audio mode, MPNowPlayingInfoCenter and MPRemoteCommandCenter.
3. Configure a CPTemplateApplicationScene and implement CPTemplateApplicationSceneDelegate; use CPListTemplate for library and queue and CPNowPlayingTemplate for playback. Only enable the com.apple.developer.carplay-audio entitlement after approval and provisioning.
4. Migrate or explicitly import the web library and downloads into native storage. A native app cannot assume it can access Safari PWA storage. No account or synchronization backend currently exists.
5. Build/sign in Xcode and test the CarPlay simulator and a parked vehicle. Follow Apple review guidelines. Transcripts and complex settings belong on the phone, not the driving display.

Apple documentation: https://developer.apple.com/documentation/carplay/preparing-your-ios-app-for-carplay-development

Native integration has not yet been implemented or approved.
