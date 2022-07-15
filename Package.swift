// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Moya",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "Moya", targets: ["Moya"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exactItem("5.4.4"))
    ],
    targets: [
        .target(
            name: "Moya",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire")
            ],
            exclude: [
                "Supporting Files/Info.plist"
            ]
        )
    ]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfiguration([
    "rocket": [
        "before": [
            "scripts/update_changelog.sh",
            "scripts/update_podspec.sh"
        ],
        "after": [
            "rake create_release\\[\"$VERSION\"\\]",
            "scripts/update_docs_website.sh"
        ]
    ]
]).write()
#endif
