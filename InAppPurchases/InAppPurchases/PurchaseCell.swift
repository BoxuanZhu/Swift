//
//  PurchaseCell.swift
//  InAppPurchases
//
//  Created by Boxuan Zhu on 6/11/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class PurchaseCell: UICollectionViewCell {
    
    @IBOutlet weak var purchaseLbl: UILabel!
    @IBOutlet weak var purchaseImg: UIImageView!
    
    func configCell(imageName: String, price: String){
        switch imageName {
        case "com.developes.InAppPurchase.tier10":
            purchaseImg.image = UIImage(named: "Arcade-1")
            purchaseLbl.text = price
            break
        case "com.developes.InAppPurchase.tier9":
            purchaseImg.image = UIImage(named: "Arcade-2")
            purchaseLbl.text = price
            break
        case "com.developes.InAppPurchase.tier8":
            purchaseImg.image = UIImage(named: "Arcade-3")
            purchaseLbl.text = price
            break
        case "com.developes.InAppPurchase.tier7":
            purchaseImg.image = UIImage(named: "Arcade-4")
            purchaseLbl.text = price
            break
        case "com.developes.InAppPurchase.tier5":
            purchaseImg.image = UIImage(named: "Bear-1")
            purchaseLbl.text = price
            break
        default:
            break
        }
    }
    
}
