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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.2.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "197ff54a4518c336f7c7b8d3667093cd4bef5ebdf5e83217bafe01f5561cc423"
        ),
    ]
)
