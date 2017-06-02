//
//  RoundButton.swift
//  ParkMe
//
//  Created by Boxuan Zhu on 6/1/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
    }

}
