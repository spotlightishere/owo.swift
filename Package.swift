// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "owo.swift",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "owo.swift",
            targets: ["owo.swift"]
        ),
    ],
    dependencies: [
        // TODO: Do not use the async-handlers branch
        .package(url: "https://github.com/Alamofire/Alamofire.git", .branch("feature/async-handlers")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "owo.swift",
            dependencies: ["Alamofire"]
        ),
        .testTarget(
            name: "owo.swiftTests",
            dependencies: ["owo.swift"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
