// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FlexLayout",
  platforms: [
    .iOS(.v12),
  ],
  products: [
    .library(name: "FlexLayout", targets: ["FlexLayout"]),
  ],
  dependencies: [
    .package(name: "FlexYoga", url: "https://github.com/facebook/yoga.git", from: "3.1.0"),
  ],
  targets: [
    .target(
      name: "FlexLayout",
      dependencies: ["FlexLayoutYogaKit"],
      path: "Sources/Swift",
      publicHeadersPath: "Public"
    ),
    .target(
      name: "FlexLayoutYogaKit",
      dependencies: [.product(name: "yoga", package: "FlexYoga")], // Change here
      path: "Sources/YogaKit",
      publicHeadersPath: "include/YogaKit"
    ),
    .testTarget(
      name: "FlexLayoutTests",
      dependencies: [
        "FlexLayout",
      ]
    ),
  ],
  cxxLanguageStandard: CXXLanguageStandard(rawValue: "c++20")
)
