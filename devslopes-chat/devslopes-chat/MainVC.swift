//
//  MainVC.swift
//  devslopes-chat
//
//  Created by Boxuan Zhu on 6/18/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit
import Firebase



class MainVC: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    func keyboardWillShow(notif: NSNotification) {
        if let keyboardSize = (notif.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notif: NSNotification) {
        if let keyboardSize = (notif.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessageBtnTapped(_ sender: Any) {
        guard let messageText = messageTextField.text else {
            showAlert(title: "Error", message: "Please enter a message")
            return
        }
        
        guard messageText != "" else {
            showAlert(title: "Error", message: "No message to send")
            return
        }
        
        print("user name is \(AuthService.instance.username), message is \(messageText)")
        if let user = AuthService.instance.username {
            
            DataService.instance.saveMessage(user, message: messageText)
            messageTextField.text = ""
            dismissKeyboard()
            tableView.reloadData()
        }
    }
    @IBAction func logOutBtnTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "showSignInVC", sender: nil)
        } catch {
            print("An error occured when sigining out")
        }
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

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("the number of messages is \(DataService.instance.messages.count)")
        return DataService.instance.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msg = DataService.instance.messages[(indexPath as NSIndexPath).row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageCell {
            if let user = msg.userId, let message = msg.message {
                cell.configureCell(user: user, message: message)
            }
            return cell
        }else {
            return MessageCell()
        }
    }
}

extension MainVC: DataServiceDelegate {
    
    func dataLoaded() {
        tableView.reloadData()
        if DataService.instance.messages.count > 0 {
            let indexPath = IndexPath(row: DataService.instance.messages.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
