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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.3.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "532e4df1ca71e72783ec48672bb37a5792e2bac0ae6c7d21dbe6e135d35b9afd"
        ),
    ]
)
