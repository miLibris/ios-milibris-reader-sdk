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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v0.4.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "c5f0d5eabf6acb759711e6287f43ac7d76265086a9097f81f28552ca282aaebd"
        ),
    ]
)
