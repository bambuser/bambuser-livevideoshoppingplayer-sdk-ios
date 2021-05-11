// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BambuserLiveShoppingPlayer",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BambuserLiveShoppingPlayer",
            targets: ["BambuserLiveShoppingPlayer"])
    ],
    targets: [
        .binaryTarget(
            name: "BambuserLiveShoppingPlayer",
            path: "Sources/LiveShoppingPlayer.xcframework")
    ]
)
