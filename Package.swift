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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.5.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "2af64f6cedbc37068d9c0fb1e734c8f490ce53d9a61d9c02fb1caf3dde1dcdbb"
        ),
    ]
)
