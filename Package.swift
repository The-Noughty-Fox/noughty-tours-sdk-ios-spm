// swift-tools-version: 5.9
// Generated for each NoughtyToursSDK release — do not edit by hand.
import PackageDescription

let version = "0.2.0"
let downloadBase = "https://github.com/The-Noughty-Fox/noughty-tours-sdk-ios-spm/releases/download/\(version)"

let package = Package(
    name: "NoughtyToursSDK",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "NoughtyToursSDK", targets: ["NoughtyToursSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "NoughtyToursSDK",
            url: "\(downloadBase)/NoughtyToursSDK.xcframework.zip",
            checksum: "848c6ad50249189d9d326dc3bc3859edf5e1b9065894216563bebf1f92cb2323"
        ),
    ]
)
