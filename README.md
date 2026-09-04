# NoughtyTours SDK

Drop-in property capture for iOS: your users create a property, walk it to map its floor plan,
capture panoramas room by room, and everything is stored locally and uploaded in the background.
You add one package, write one import, and push the screens the SDK vends onto your own
navigation stack.

📘 **[Documentation](https://the-noughty-fox.github.io/noughty-tours-sdk-ios-spm/documentation/noughtytourssdk)**
— setup, a full walkthrough, and every public symbol. Start there.

## Installation

In Xcode: **File → Add Package Dependencies…** with

```
https://github.com/The-Noughty-Fox/noughty-tours-sdk-ios-spm.git
```

Pick the [latest release](../../releases) and depend on the single product, `NoughtyToursSDK`. The
package has no dependencies of its own — everything the SDK needs is inside the binary.

## Requirements

- **iOS 17+**, arm64 only — device and Apple-silicon simulator slices.
- **A real device with a LiDAR scanner** for anything that captures or syncs. App Attest is
  unavailable in the simulator, so the simulator runs the local screens only.
- **The App Attest capability** on your own App ID: the SDK authenticates itself by attesting the
  device against *your* app.
- **A `pk_ios_*` publishable key** issued to your app by The Noughty Fox.

The last two cannot be pre-configured for you. Send us your **bundle identifier** and **Team ID**
to get a key, then follow
**[Setting up App Attest](https://the-noughty-fox.github.io/noughty-tours-sdk-ios-spm/documentation/noughtytourssdk/appattest)**.

## Support

Questions, a publishable key, or a backend registration: <support@thenoughtyfox.com>.

- **[Changelog](./CHANGELOG.md)** — release notes and version history
- **[Notices](./NOTICES)** — third-party software licenses
- **[License](./LICENSE)** — SDK license terms

---

© 2026 The Noughty Fox. All rights reserved.
