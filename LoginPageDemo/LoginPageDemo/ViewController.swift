//
//  ViewController.swift
//  LoginPageDemo
//
//  Created by Darshika Patel on 24/03/20.
//  Copyright © 2020 Darshika Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var isShowAlert : Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.addTarget(self, action: #selector(valueChangedOnTab(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(valueChangedOnTab(_:)), for: .editingChanged)
    }
    
    @objc func valueChangedOnTab(_ textField: UITextField) {
        if let text = textField.text {
            print(text)
        }
    }
    
    private func showAlert(_ message: String, completionHandler: @escaping () -> ()) {
        let controller = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            completionHandler()
        }
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }

    @IBAction func loginButton(_ psender: Any) {
        
        if userNameTextField.text == "abc" && passwordTextField.text == "abc" {
            showAlert("Login successful") {
                UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
                let window = UIApplication.shared.windows.first!
                window.rootViewController = UINavigationController(rootViewController: vc)
                window.makeKeyAndVisible()
            }
        } else {
            showAlert("Login Fail. Enter Valid Credential") { }
        }
    }
    
}
extension ViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userNameTextField {
            textField.placeholder = ""
        } else {
            textField.placeholder = ""
        }
    }
    
    private func textFieldShouldReturn(_ textField: UITextField) {
        if textField == userNameTextField {
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.userNameTextField.becomeFirstResponder()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == userNameTextField {
            textField.placeholder = "UserName:"
        } else {
            textField.placeholder = "Password:"
        }
    }
}
