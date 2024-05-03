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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.8.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "c6ee25f1188f49428d27d52887dc466c812241a99c598226cd6af23df53e4ca9"
        ),
    ]
)
