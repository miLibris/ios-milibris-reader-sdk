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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v0.5.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "62f9b0281881270df6d2aeb40d05d50428ce886ea61050ec2042571215190917"
        ),
    ]
)
