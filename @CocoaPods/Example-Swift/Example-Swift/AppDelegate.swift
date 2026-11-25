//
//  AppDelegate.swift
//  Example-Swift
//
//  Created by ECPay.
//  Copyright © 2020 ECPay. All rights reserved.
//

import UIKit
import ECPayPaymentGatewayKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // 範例
        ECPayPaymentGatewayManager.sharedInstance().initialize(env: .Stage)
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
