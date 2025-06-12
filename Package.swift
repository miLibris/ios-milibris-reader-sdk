// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MiLibrisReaderSDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "MiLibrisReaderSDK",targets: ["MiLibrisReaderSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "MiLibrisReaderSDK",
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.11.1/MiLibrisReaderSDK.xcframework.zip",
            checksum: "f719e06d62be0683eabbc66779814ca300272016592e7dc9c65a8b1e4afeacdf"
        ),
    ]
)
