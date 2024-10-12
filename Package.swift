// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Termbox",
    products: [
        .library(name: "Termbox", targets: ["Termbox"]),
        .library(name: "ctermbox", targets: ["ctermbox"]),
    ],
    targets: [
        .target(name: "Termbox", dependencies: ["ctermbox"]),
        .target(
            name: "ctermbox", exclude: ["src/input.inl", "src/term.inl", "src/bytebuffer.inl"],
            cSettings: [.define("_XOPEN_SOURCE")]),
        .target(name: "paint", dependencies: ["Termbox"], path: "Examples/paint"),
    ],
    cLanguageStandard: .c11
)
