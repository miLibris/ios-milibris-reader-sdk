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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.7.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "7d117adcfac94a308457628c1062b5340ffa4224a64866f9b9548659dec19a7c"
        ),
    ]
)
