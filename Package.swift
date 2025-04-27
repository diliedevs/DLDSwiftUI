// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DLDSwiftUI",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(name: "DLDSwiftUI", targets: ["DLDSwiftUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/diliedevs/DLDFoundation", from: "1.0.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", from: "6.0.0"),
        .package(url: "https://github.com/yannickl/DynamicColor", from: "5.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "DLDSwiftUI", dependencies: ["DLDFoundation", "SFSafeSymbols", "DynamicColor"]),
    ]
)
