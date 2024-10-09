// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-itunes-search-api",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
        .tvOS(.v14),
        .watchOS(.v8),
        //.linux
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "swift-itunes-search-api", targets: ["iTunesSearchAPI"]),
        .executable(name: "swift-itunes-search", targets: ["swift-itunes-search"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
        .package(url: "https://github.com/Cornucopia-Swift/CornucopiaHTTP", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "iTunesSearchAPI"),
        .executableTarget(
            name: "swift-itunes-search",
            dependencies: [
                "iTunesSearchAPI",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "CornucopiaHTTP", package: "CornucopiaHTTP"),
            ]
        ),
        .testTarget(name: "swift-itunes-search-apiTests", dependencies: ["iTunesSearchAPI"]),
    ]
)
