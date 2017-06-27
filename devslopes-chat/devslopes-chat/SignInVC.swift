//
//  SignInVC.swift
//  devslopes-chat
//
//  Created by Boxuan Zhu on 6/18/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInBtn.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        
        guard let email = userNameTextField.text, let password = passwordTextField.text else {
            showAlert(title: "Error", message: "Please enter an Email and an Password")
            return
        }
        
        guard email != "", password != "" else {
            showAlert(title: "Error", message: "Please enter an Email and an Password")
            return
        }
        
        AuthService.instance.emailLogin(email, password: password) { (success, message) in
            if success {
                self.setUsername()
                self.performSegue(withIdentifier: "showMainVC", sender: nil)
            } else {
                self.showAlert(title: "Failure", message: message)
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func setUsername() {
        if let user = Auth.auth().currentUser {
            AuthService.instance.isLoggedIn = true
            let emailComponents = user.email?.components(separatedBy: "@")
            if let username = emailComponents?[0] {
                AuthService.instance.username = username
            }
        } else {
            AuthService.instance.isLoggedIn = false
            AuthService.instance.username = nil
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setUsername()
        if AuthService.instance.isLoggedIn {
            performSegue(withIdentifier: "showMainVC", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
