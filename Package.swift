// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "ECPayPaymentGatewayKit_iOS_SPM",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ECPayPaymentGatewayKit_iOS_SPM",
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
            url: "https://github.com/ECPay/ECPayPaymentGatewayKit_iOS_SPM/releases/download/1.11.1/ECPayPaymentGatewayKit.zip",
            checksum: "827cf49a24b5b85ad9945eeaa984a6e858670e83c55ce79f2b712aa92b72ad74"
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
