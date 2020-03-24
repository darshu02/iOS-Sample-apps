//
//  AppDelegate.swift
//  LoginPageDemo
//
//  Created by Darshika Patel on 24/03/20.
//  Copyright © 2020 Darshika Patel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let isLoggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool {
            
            if isLoggedIn == true {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
                window?.rootViewController = UINavigationController(rootViewController: vc)
            } else {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
                window?.rootViewController = UINavigationController(rootViewController: vc)
            }
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        return true
    }
    
    
}

