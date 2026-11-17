// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SwiftMacroTestCommons",
    platforms: [.macOS(.v13), .iOS(.v17)],
    products: [.library(name: "SwiftMacroTestCommons", targets: ["SwiftMacroTestCommons"])],
    dependencies: [.package(url: "https://github.com/swiftlang/swift-syntax.git", "600.0.0"..<"700.0.0")],
    targets: [
        .target(
            name: "SwiftMacroTestCommons",
            dependencies: [
                .product(name: "SwiftSyntaxMacrosGenericTestSupport", package: "swift-syntax")
            ]),
        .testTarget(name: "SwiftMacroTestCommonsTests", dependencies: ["SwiftMacroTestCommons"]),
    ],
    swiftLanguageModes: [.v6]
)
