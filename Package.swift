// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionDuplicateRemoval",
    products: [
        .library(
            name: "CollectionDuplicateRemoval",
            targets: ["CollectionDuplicateRemoval"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CollectionDuplicateRemoval",
            dependencies: []),
        .testTarget(
            name: "CollectionDuplicateRemovalTests",
            dependencies: ["CollectionDuplicateRemoval"]),
    ]
)
