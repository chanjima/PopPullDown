// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PopPullDown",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "PopPullDown",
            targets: ["PopPullDown"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PopPullDown",
            dependencies: []),
        .testTarget(
            name: "PopPullDownTests",
            dependencies: ["PopPullDown"]),
    ]
)
