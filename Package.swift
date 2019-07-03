// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "Tinker2",
  platforms: [
    .macOS(.v10_15), .iOS(.v13)
  ],
  products: [
    .executable(name: "Tinker2", targets: [ "Tinker2" ])
  ],
  dependencies: [
    .package(url: "https://github.com/SwiftWebUI/SwiftWebUI.git",
             from: "0.1.4")
  ],
  targets: [
    .target(name: "Tinker2", dependencies: [ "SwiftWebUI" ])
  ]
)
