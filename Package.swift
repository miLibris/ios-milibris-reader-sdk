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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.4.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "d3dd696eb6c64ae040c00af5cc049c73cc6a1758183236cdb146ca9cd7700eb1"
        ),
    ]
)
