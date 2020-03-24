//
//  HomePageViewController.swift
//  LoginPageDemo
//
//  Created by Darshika Patel on 24/03/20.
//  Copyright © 2020 Darshika Patel. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let window = UIApplication.shared.windows.first
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
}
