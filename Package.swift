// swift-tools-version: 5.9
// Generated for each TNF360SDK release — do not edit by hand.
import PackageDescription

let version = "0.1.0"
let downloadBase = "https://github.com/The-Noughty-Fox/tnf360-sdk-ios-spm/releases/download/\(version)"

let package = Package(
    name: "TNF360SDK",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "TNF360SDK", targets: ["TNF360SDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "TNF360SDK",
            url: "\(downloadBase)/TNF360SDK.xcframework.zip",
            checksum: "16307a562a7f1cd6defdab41758a28bf2056187d554a586045d60e818ecb8bd7"
        ),
    ]
)
