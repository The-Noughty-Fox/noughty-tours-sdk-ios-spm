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
            checksum: "a100ad06c2833216b407ca033c28d5657d943d6deb71668db9c9647685fc60d2"
        ),
    ]
)
