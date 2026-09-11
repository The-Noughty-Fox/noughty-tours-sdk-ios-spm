# Changelog

All notable changes to the NoughtyTours SDK are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Release tags are bare SemVer (no `v` prefix).

## [Unreleased]

_Changes that have not yet been released will be listed here._

## [0.1.0]

Initial binary release.

### Added
- Closed-source Swift Package Manager distribution of the NoughtyTours SDK as a prebuilt,
  cross-Xcode static `xcframework`, exposed through a **single `NoughtyToursSDK` product** and a
  **single import** (`import NoughtyToursSDK`).
- **`NoughtyTours`** — one instance per process, built from a `Configuration`
  (environment, publishable key, organisation provider, settings provider). `init` cannot fail;
  `start()` prepares local storage and reconnects to in-flight uploads, and is idempotent.
- **Device-level auth.** The SDK authenticates *itself*: every capture/data request carries
  a bearer minted from an Apple **App Attest** assertion, scoped to the organisation the host
  supplies. `prepareDeviceAuth()` establishes it up front; `revokeDeviceSession()` tears it
  down. There is no user login in the SDK — the host owns that and supplies only the selected
  organisation via `OrganizationProviderType`.
- **Screens vended from the core** in three namespaces — `core.properties`,
  `core.structureCapture`, `core.panoramaCapture` — each reporting through one typed
  `onEvent` closure whose events carry the handle for the next screen.
  `PanoramaCaptureEvent` matches its structure-capture neighbour: a `.cancelled`
  case, and a `.finished` that carries the floor and how many panoramas the visit added.
- **iPhone and iPad.** The capture screens and the modal cards lay out correctly on iPad,
  where the cards stay dialog-sized rather than stretching to the full width.
- **Property/floor/room handles without the list screen**: `createProperty(name:floorCount:metadata:)`
  and `property(id:)`, for hosts that already know what they are capturing. Both are `async`:
  they start the core themselves, so a host that builds a screen before awaiting `start()`
  gets an error rather than a trap.
- **Host metadata on a tour.** `createProperty` takes an optional `metadata` — any `Encodable`
  that encodes to a JSON object — serialized once at the boundary and sent when the tour is
  created, so a work order or job id travels to the backend with the capture. Set **once, at
  creation**: the update request carries no such field, and a property created without it never
  gets any. The only check is that the value is a JSON *object*; anything else is
  `NoughtyToursError.invalidMetadata`, which is not retryable.
- **Reading what a capture produced.** `status(of:)` for a point-in-time read and
  `statusUpdates(for:)` for an `AsyncStream` driven by the database's own change notifications;
  both run the same query, so a poll and a stream cannot disagree.
  `PropertyStatus` carries the backend tour id (`nil` until the first sync), the
  sync state, and floor/room/panorama counts including uploaded and failed.
- **Typed errors** — `NoughtyToursError` and `AuthError`, both `LocalizedError` with an
  `isRetryable` flag and a stable `code` (lowercase dot-separated slugs, one per case, tabulated
  on each property). Unlike `description` and the `reason` payloads, which are diagnostics whose
  wording may change, a code is API: safe to log, to forward, and to branch on.
- **Offline-first storage and sync**: capture never blocks on connectivity, and uploads
  continue in the background, reconnecting to transfers still in flight across launches.
- **The SDK logs for itself** (`Log`). Its lines are printed to the console
  prefixed `[NoughtyToursSDK]`, filtered by `Log.level`. Every line, down to
  `debug`, is written to the SDK's on-device log file (`Documents/Logs/capture-runtime.log`)
  whatever the level says, so a bug report stays complete at any verbosity.
- `NoughtyTours.isDeviceSupported` for gating the capture flow on LiDAR availability.
- Bundled assets and localized strings resolved automatically at runtime. A missing resource
  bundle degrades to raw keys on screen rather than taking the host app down.
- **Every property has a name.** `createProperty(name:)` takes a non-optional `String`, trimmed
  before it reaches the API; a blank one is rejected with `NoughtyToursError.invalidName` rather
  than silently becoming an English placeholder. Floor and room names stay optional — the
  backend models an unnamed floor or room, and a floor titles itself from its number.
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
