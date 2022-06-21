// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccessibilitySnapshot",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Core + SnapshotTesting for image comparison
        .library(
            name: "AccessibilitySnapshot",
            targets: ["AccessibilitySnapshot"]
        ),
        
        .library(
            name: "AccessibilitySnapshotCore",
            targets: ["AccessibilitySnapshotCore"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pimms/swift-snapshot-testing.git",
            .branch("optimization")
        )
    ],
    targets: [
        .target(
            name: "AccessibilitySnapshotCore-ObjC",
            path: "Sources/AccessibilitySnapshot/Core/ObjC"
        ),
        .target(
            name: "AccessibilitySnapshotCore",
            dependencies: ["AccessibilitySnapshotCore-ObjC"],
            path: "Sources/AccessibilitySnapshot/Core/Swift"
        ),
        .target(
            name: "AccessibilitySnapshot",
            dependencies: ["AccessibilitySnapshotCore", .product(name: "SnapshotTesting", package: "swift-snapshot-testing")],
            path: "Sources/AccessibilitySnapshot/SnapshotTesting"
        )
    ]
)
