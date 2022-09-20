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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v0.3.1/MiLibrisReaderSDK.xcframework.zip",
            checksum: "d3f5fd7c5cd284a38fe0436c22922e1e7a00d36619990ea31b8af2c58acbc4c3"
        ),
    ]
)
