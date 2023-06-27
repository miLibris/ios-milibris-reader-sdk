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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.1.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "c2da9691a196ca0b8b5fc19802042b471571d6832ebe3a47c63ab90d766d4bd8"
        ),
    ]
)
