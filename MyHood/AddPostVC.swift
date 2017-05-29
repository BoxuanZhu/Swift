//
//  AddPostVC.swift
//  MyHood
//
//  Created by Boxuan Zhu on 5/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var titleField: UITextField! 
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var addPicBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    let maxLenTitle = 30
    let maxLenDesc = 250

    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = 120
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        titleField.delegate = self
        descField.delegate = self
    

        // Do any additional setup after loading the view.
    }

    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
        if let title = titleField.text, let desc = descField.text, let img = postImg.image{
            let imgPath = DataService.instance.saveImageAndCreatePath(image: img)
            let post = Post(imagePath: imgPath, title: title, postDesc: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = selectedImage
        addPicBtn.setTitle("", for: .normal)// make the button disappear when pressed
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            scrollView.setContentOffset(CGPoint(x: 0,y: 100), animated: true)
        default:
            scrollView.setContentOffset(CGPoint(x: 0,y: 200), animated: true)
        }
        
        //print("textfield tag is \(textField.tag)")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField.tag == 1){
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= maxLenTitle // Bool
        }
        else if(textField.tag == 2){
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= maxLenDesc // Bool
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        scrollView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
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
