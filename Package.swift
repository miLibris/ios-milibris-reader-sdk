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
            url: "https://github.com/miLibris/ios-milibris-reader-sdk/releases/download/v1.9.0/MiLibrisReaderSDK.xcframework.zip",
            checksum: "e985b35056818f3f6b1d9f4fafd397ec8b1e733e181849736041072e08b39f2b"
        ),
    ]
)
