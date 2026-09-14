//
//  AppDelegate.swift
//  Example-Swift
//
//  Created by ECPay.
//  Copyright © 2020 ECPay. All rights reserved.
//

import UIKit
import ECPayPaymentGatewayKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // 範例
        IQKeyboardManager.shared.enable = true
        ECPayPaymentGatewayManager.sharedInstance().initialize(env: .Stage)
        return true
    }

}

