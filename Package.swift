import PackageDescription

let package = Package(
    name: "S4",
    dependencies: [
        .Package(url: "https://github.com/swiftx/c7.git", majorVersion: 0, minor: 1)
    ]
)
