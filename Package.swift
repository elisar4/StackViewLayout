// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "StackViewLayout",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "StackViewLayout", targets: ["StackView"]),
    ],
    targets: [
        .target(name: "StackView", path: "Sources"),
    ]
)
