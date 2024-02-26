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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.6.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "766ce939061f9f163c4ce4a7b3ab448214d44f1147faa03fa41eae5f9dd48fe9"
        ),
    ]
)
