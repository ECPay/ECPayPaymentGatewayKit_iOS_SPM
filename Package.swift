// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "SPMText",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SPMText",
            targets: ["ECPayPaymentGatewayKitWrapper"]  // 改指向 wrapper
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.10.1"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift", exact: "1.8.0"),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager", exact: "7.0.0"),
        .package(url: "https://github.com/evgenyneu/keychain-swift", exact: "20.0.0"),
        .package(url: "https://github.com/mxcl/PromiseKit", exact: "6.13.0"),
        .package(url: "https://github.com/yahoojapan/SwiftyXMLParser", exact: "5.6.0"),
    ],
    targets: [
        .binaryTarget(
            name: "ECPayPaymentGatewayKit",
            url: "https://github.com/su0928597196/SPMText2/releases/download/1.4.0/ECPayPaymentGatewayKit.zip",
            checksum: "44ee1d6b99a8c4725e8e4266951c82b10573b2c5d96b2a7dd9f4e7ad80824f11"
        ),
        .target(
            name: "ECPayPaymentGatewayKitWrapper",
            dependencies: [
                "ECPayPaymentGatewayKit",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
                .product(name: "KeychainSwift", package: "keychain-swift"),
                .product(name: "PromiseKit", package: "PromiseKit"),
                .product(name: "SwiftyXMLParser", package: "SwiftyXMLParser"),
            ],
            path: "ECPayPaymentGatewayKitWrapper"
        )
    ]
)
