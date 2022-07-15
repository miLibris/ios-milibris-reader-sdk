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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v0.0.1/MiLibrisReaderSDK.xcframework.zip",
            checksum: "c5209b67e3238e334c8d1342ce5f1af6e6f247426476de735c6bc380d8068672"
        ),
    ]
)
