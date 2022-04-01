// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BambuserLiveVideoShoppingPlayer",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "BambuserLiveVideoShoppingPlayer",
            targets: ["BambuserLiveVideoShoppingPlayer"])
    ],
    targets: [
        .binaryTarget(
            name: "BambuserLiveVideoShoppingPlayer",
            path: "Sources/BambuserLiveVideoShoppingPlayer.xcframework")
    ]
)
