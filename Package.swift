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
            checksum: "5b39126e136594b74880b5bd295861fe3d1300f5cef7e946e3a9dcc1c1937845"
        ),
    ]
)
