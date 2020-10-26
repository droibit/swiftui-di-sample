//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Shinya Kumagai on 2020/10/21.
//

import UIKit

// TODO: Really need `AppDelegate`?
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerProviderFactories()
        return true
    }
}
