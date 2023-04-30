import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init([
        .package(path: "./Cwifty")
    ]), platforms: [.iOS]
)
