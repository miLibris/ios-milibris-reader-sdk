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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.10.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "35ba3efe01f578be0459d2b3da2a7e07efbb784bc541d0d09643a47bdcfca4b3"
        ),
    ]
)
