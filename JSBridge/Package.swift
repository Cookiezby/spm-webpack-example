// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSBridge",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "JSBridge",
            targets: ["JSBridge"]),
        .plugin(name: "WebpackPlugin", targets: ["WebpackPlugin"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "JSBridge"),
        .testTarget(
            name: "JSBridgeTests",
            dependencies: ["JSBridge"]),
        .plugin(name: "WebpackPlugin", capability: .command(intent: .custom(verb: "compile-ts", description: ""), permissions: [.writeToPackageDirectory(reason: "Compile TypeScript file")]))
    ]
)
