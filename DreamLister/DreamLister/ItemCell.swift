//
//  ItemCell.swift
//  DreamLister
//
//  Created by Boxuan Zhu on 6/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Item){
        thumb.image = item.image?.image as?  UIImage
        title.text = item.title
        price.text = "\(item.price)"
        details.text = item.details
    }
    

}
