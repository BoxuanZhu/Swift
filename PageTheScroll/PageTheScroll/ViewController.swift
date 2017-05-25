//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Boxuan Zhu on 5/25/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var images = [UIImageView]()
    var contentWidth: CGFloat = 0.0
    var newX: CGFloat = 0.0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
           
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            print("view.frame.midX  is \(view.frame.midX),view.frame.size.width is \(view.frame.size.width)  , newX is \(newX) ")
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75 , y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
            print("newX - 75 is \(newX - 75)")
        }
        contentWidth = 3 * view.frame.size.width
        print("contentWidth is \(contentWidth)")
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

