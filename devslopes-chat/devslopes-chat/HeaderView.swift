//
//  HeaderView.swift
//  devslopes-chat
//
//  Created by Boxuan Zhu on 6/18/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 2
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
