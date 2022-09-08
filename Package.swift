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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v0.3.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "e7a522e0fb1c43d30c8849733a7aa70d60fc33ab8847471d80c0dab0c07f07fa"
        ),
    ]
)
