# SwiftMacroTestCommons

A Swift Testing adapter for SwiftSyntax macro expansion tests, companion to
[SwiftTestCommons](https://github.com/maniramezan/SwiftTestCommons).

It is a separate package because SwiftPM applies platform minimums package-wide: this
package supports macOS 13 and iOS 17, below SwiftTestCommons' minimums, so macro packages
can test against it without raising their own deployment targets. SwiftTestCommons
consumers never resolve or build SwiftSyntax.

The SwiftSyntax dependency range is 600..<700; consumer constraints select the version.

```swift
import SwiftMacroTestCommons

assertMacroExpansion(source, expandedSource: expected, macros: implementations)
```

Failures use `Issue.record` with the failure handler's source location. Forward
fileID, filePath, line, and column when wrapping the assertion. Existing diagnostic,
fix-it, and note specifications are re-exported as public typealiases.

Add the package to a macro test target:

```swift
.package(url: "https://github.com/maniramezan/SwiftMacroTestCommons.git", from: "0.2.0")
```

Use `.product(name: "SwiftMacroTestCommons", package: "SwiftMacroTestCommons")`
in the test target's dependencies. Run `swift build`, `swift test`, and
`swift format lint --strict --recursive Package.swift Sources Tests` to validate.
Swift 6.2 with SwiftSyntax 600.0.1 and Swift 6.4 with SwiftSyntax 604 are verified.
