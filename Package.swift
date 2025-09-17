// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CalendarSPM",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CalendarSPM",
            targets: ["CalendarSPM"]),
    ],
    dependencies: [
        // 这里暂时不依赖其他包
    ],
    targets: [
        .target(
            name: "CalendarSPM",
            dependencies: []),
        .testTarget(
            name: "CalendarSPMTests",
            dependencies: ["CalendarSPM"]),
    ]
)
