//
//  MessageCell.swift
//  devslopes-chat
//
//  Created by Boxuan Zhu on 6/18/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func configureCell(user: String, message: String){
        userLbl.text = user
        messageLbl.text = message
    }
}
