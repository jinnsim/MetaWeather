//
//  AppDelegate.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

