// swift-tools-version: 6.0
// Native helper framework for the AppLooma RTC iOS SDK.
//
// This is a redistribution of open source work; see NOTICE for attribution.
// You do not depend on this package directly — depend on AppLoomaRTC.

import PackageDescription

let package = Package(
    name: "AppLoomaUniFFI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v14),
        .tvOS(.v17),
    ],
    products: [
        .library(
            name: "AppLoomaUniFFI",
            targets: ["LiveKitUniFFI"]
        )
    ],
    targets: [
        .target(
            name: "LiveKitUniFFI",
            dependencies: ["RustLiveKitUniFFI"]
        ),
        // The binary target name must match the module inside the .xcframework,
        // so it is not renamed. The product above is what other packages refer
        // to, and it is ours.
        .binaryTarget(
            name: "RustLiveKitUniFFI",
            url: "https://github.com/apploomadev/iOS-UniFFI/releases/download/0.1.9/RustLiveKitUniFFI.xcframework.zip",
            checksum: "8db93e8ccd9f22263c39855808da48a4d6b5d620d8f6e43ab4501ede847b23eb"
        )
    ]
)
