// swift-tools-version: 6.2
// Native helper framework for the AppLooma RTC iOS SDK.
//
// This variant is picked up by Swift 6.2 and newer toolchains. It exists to
// carry the language-mode pin below, which the default manifest cannot express.

import PackageDescription

let package = Package(
    name: "AppLoomaUniFFI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v14),
        .visionOS(.v26),
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
        .binaryTarget(
            name: "RustLiveKitUniFFI",
            url: "https://github.com/apploomadev/iOS-UniFFI/releases/download/0.1.9/RustLiveKitUniFFI.xcframework.zip",
            checksum: "8db93e8ccd9f22263c39855808da48a4d6b5d620d8f6e43ab4501ede847b23eb"
        )
    ],
    // The generated bindings declare callback `vtablePtr` without
    // `nonisolated(unsafe)`, which the Swift 6 language mode rejects. Build them
    // in Swift 5 mode until the generator is updated upstream.
    swiftLanguageModes: [.v5]
)
