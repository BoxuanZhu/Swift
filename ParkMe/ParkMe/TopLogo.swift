//
//  TopLogo.swift
//  ParkMe
//
//  Created by Boxuan Zhu on 6/1/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class TopLogo: UIImageView {

    override func awakeFromNib() {
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
    }

}
