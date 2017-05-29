//
//  DetailPost.swift
//  MyHood
//
//  Created by Boxuan Zhu on 5/29/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class DetailPost: UIViewController {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descTxtView: UITextView!
    
    var rowIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("rowIndex is \(rowIndex)")
        let post = DataService.instance.loadedPosts[rowIndex]
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        titleLbl.text = post.title
        descTxtView.text = post.postDesc
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
