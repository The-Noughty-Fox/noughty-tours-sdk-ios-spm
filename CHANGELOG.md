# Changelog

All notable changes to the TNF360 SDK are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Release tags are bare SemVer (no `v` prefix).

## [Unreleased]

_Changes that have not yet been released will be listed here._

## [0.1.0]

Initial binary release.

### Added
- Closed-source Swift Package Manager distribution of the TNF360 SDK as a prebuilt,
  cross-Xcode static `xcframework`, exposed through a **single `TNF360SDK` product** and a
  **single import** (`import TNF360SDK`).
- **`TNF360Core`** — one instance per process, built from a `TNF360Configuration`
  (environment, publishable key, organisation provider, settings provider). `init` cannot fail;
  `start()` prepares local storage and reconnects to in-flight uploads, and is idempotent.
- **Device-level auth.** The SDK authenticates *itself*: every capture/data request carries
  a bearer minted from an Apple **App Attest** assertion, scoped to the organisation the host
  supplies. `prepareDeviceAuth()` establishes it up front; `revokeDeviceSession()` tears it
  down. There is no user login in the SDK — the host owns that and supplies only the selected
  organisation via `TNF360OrganizationProviderType`.
- **Screens vended from the core** in three namespaces — `core.properties`,
  `core.structureCapture`, `core.panoramaCapture` — each reporting through one typed
  `onEvent` closure whose events carry the handle for the next screen.
- **Property/floor/room handles without the list screen**: `createProperty(name:floorCount:)`
  and `property(id:)`, for hosts that already know what they are capturing.
- **Typed errors** — `TNF360Error` and `TNF360AuthError`, both `LocalizedError` with an
  `isRetryable` flag.
- **Offline-first storage and sync**: capture never blocks on connectivity, and uploads
  continue in the background, reconnecting to transfers still in flight across launches.
- **Host log hook** (`TNF360Log`) for surfacing the SDK's diagnostics in the host's own logging.
- `TNF360Core.isDeviceSupported` for gating the capture flow on LiDAR availability.
- Bundled assets and localized strings resolved automatically at runtime.
- Third-party `NOTICES` and `LICENSE`.

### Notes
- Requires **iOS 17.0+** and **Xcode 16+**.
- **arm64 only** (device + Apple-silicon simulator); Intel-Mac simulator unsupported.
- **A real device with a LiDAR scanner** is required for anything that captures or syncs;
  App Attest is additionally unavailable in the simulator.
- Requires the **App Attest** capability on your own App ID and a `pk_ios_*` publishable key
  issued by The Noughty Fox for the matching environment.
- The package resolves **no dependencies of its own** — everything the SDK needs is inside
  the binary.
- Localized in `en`, `de`, `ro` and `ru`. The SDK's screens localize themselves; there is no
  string-override hook.
