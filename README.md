# 站內付 2.0 iOS SDK

站內付 2.0 iOS SDK 提供手機端金流付款功能，支援信用卡、3D 驗證、AE 卡與其他非信用卡付款方式。

若您想了解站內付 2.0 服務，請填寫以下表單，我們將安排專人與您聯繫：  
https://member.ecpay.com.tw/MemberReg/MerchantRegister

## 功能特色

- 支援商家信用卡金流服務
- 支援消費者於 App 內輸入信用卡付款
- 支援信用卡 3D 驗證流程
- 支援 AE 卡
- 支援非信用卡付款方式

## 系統需求

- Xcode 26+
- Swift 6.2.3+
- iOS 13+

> 自 2026 年 4 月 28 日起，App Store Connect 上傳的 App 需使用 Xcode 26 或以上版本建置。

## 安裝方式

建議使用 Swift Package Manager 安裝：

https://github.com/ECPay/ECPayPaymentGatewayKit_iOS_SPM

[![SwiftPM](https://img.shields.io/github/v/release/ECPay/ECPayPaymentGatewayKit_iOS_SPM)](https://github.com/ECPay/ECPayPaymentGatewayKit_iOS_SPM)

### Xcode 安裝步驟

1. 開啟 Xcode 專案
2. 進入專案設定頁
3. 選擇 `Package Dependencies`
4. 點擊 `+`
5. 輸入套件網址：

```text
https://github.com/ECPay/ECPayPaymentGatewayKit_iOS_SPM
```

6. 加入 `ECPayPaymentGatewayKit_iOS_SPM`

### 第三方相依套件

加入 SPM 套件後，以下相依套件會自動安裝：

| 套件 | 版本 |
| --- | --- |
| Alamofire | 5.10.1 |
| CryptoSwift | 1.8.0 |
| IQKeyboardManager | 7.0.0 |
| PromiseKit | 6.13.0 |
| SwiftyXMLParser | 5.6.0 |

## 專案設定

### 相機權限

SDK 部分功能會使用相機，請於主專案的 `Info.plist` 加入：

```text
NSCameraUsageDescription
```

並填寫相機使用說明文字。

### IQKeyboardManager

SDK 1.8.0 起，SDK 內部已關閉 IQKeyboardManager 的啟用設定，以避免部分情境閃退。

如需啟用，請於 SDK 外部設定：

```swift
IQKeyboardManager.shared.enable = true
```

若不啟用，SDK 1.8.1 已修正信用卡編輯頁面點擊空白處無法關閉鍵盤的問題。

## 使用方式

### Import

```swift
import ECPayPaymentGatewayKit
```

### 初始化 SDK

建議於 `AppDelegate.swift` 初始化 SDK：

```swift
ECPayPaymentGatewayManager.sharedInstance().initialize(env: .Stage)
```

正式環境請改用：

```swift
ECPayPaymentGatewayManager.sharedInstance().initialize(env: .Prod)
```

### 建立付款

填入交易 Token 與交易編號後，即可建立付款並等待 callback：

```swift
ECPayPaymentGatewayManager.sharedInstance().createPayment(
    token: token,
    merchantID: "",
    useResultPage: use_resultPage_Switch.isOn ? 1 : 0,
    app: "測試的商店",
    language: use_enUS_Switch.isOn ? "en-US" : "zh-TW"
) { state in
    self.resultTextView.text = state.description

    if let callbackState = state as? CreatePaymentCallbackState {
        print("RtnCode = \(callbackState.RtnCode)")
        print("RtnMsg = \(callbackState.RtnMsg)")
        print("OrderInfo = \(String(describing: callbackState.OrderInfo))")
        print("CardInfo = \(String(describing: callbackState.CardInfo))")
    }
}
```

## 套件維護說明

CocoaPods 官方已公告，自 2026 年 12 月 2 日起不再接受新的 pod 推送，既有套件將轉為唯讀。

因此，建議後續改以 Swift Package Manager 版本為主。

CocoaPods 版本仍保留既有版本：  
https://cocoapods.org/pods/ECPayPaymentGatewayKit

## 聯絡方式

綠界科技技術客服信箱：  
techsupport@ecpay.com.tw

## License

Copyright © 1996-2026 Green World FinTech Service Co., Ltd. All rights reserved.
