// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Omnitrix",
    platforms: [.watchOS(.v9)],
    products: [
        .executable(name: "Omnitrix", targets: ["Omnitrix"])
    ],
    targets: [
        .executableTarget(
            name: "Omnitrix",
            path: "."
        )
    ]
)
