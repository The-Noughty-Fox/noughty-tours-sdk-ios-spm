// swift-tools-version: 5.9
// Generated for each NoughtyToursSDK release — do not edit by hand.
import PackageDescription

let version = "0.1.0"
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
            checksum: "1e7461b05dc5bd2fb9c77b365eaaf72b771f11e299764b9b04ba50ecb2e614bd"
        ),
    ]
)
