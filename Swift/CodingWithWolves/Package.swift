// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "CodingWithWolves",
    platforms: [
        .macOS("12.0")
    ],
    products: [
        .executable(
            name: "CodingWithWolves",
            targets: ["CodingWithWolves"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0")
    ],
    targets: [
        .target(
            name: "CodingWithWolves",
            dependencies: ["Publish"]
        )
    ]
)
