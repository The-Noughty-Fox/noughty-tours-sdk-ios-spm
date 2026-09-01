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
            checksum: "b1c0113ef9a67fd7d6240eb3586654b69ac00d0689df5a0ec5d037ba49b49be5"
        ),
    ]
)
