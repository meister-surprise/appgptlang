// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppGPTLang",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppGPTLang",
            targets: ["AppGPTLang"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AppGPTLang",
            dependencies: [])
    ]
)
