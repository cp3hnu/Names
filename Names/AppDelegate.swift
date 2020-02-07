//
//  AppDelegate.swift
//  Names
//
//  Created by CP3 on 11/27/19.
//  Copyright © 2019 CP3. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: APIListCtrlr())
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        return true
    }
}

