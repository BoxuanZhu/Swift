//
//  ViewController.swift
//  SimpleApp
//
//  Created by Boxuan Zhu on 5/22/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var helloImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.isHidden = true
        helloImage.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func welcomeBtnPressed(_ sender: Any) {
        bgImage.isHidden = false
        helloImage.isHidden = false
    }


}

