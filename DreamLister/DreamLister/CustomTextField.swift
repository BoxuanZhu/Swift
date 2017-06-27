//
//  CustomTextField.swift
//  DreamLister
//
//  Created by Boxuan Zhu on 6/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalide Red Component")
        assert(green >= 0 && green <= 255, "Invalide Red Component")
        assert(blue >= 0 && blue <= 255, "Invalide Blue Component")
        
        self.init(red: CGFloat(red/255), green: CGFloat(green/2255), blue: CGFloat(blue/255), alpha: 1.0)
        
    }
    
    convenience init(netHex: Int){
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
    
}

@IBDesignable

class CustomTextField: UITextField {
    
    // MARK: - IBInspectable
    @IBInspectable var tintCol: UIColor = UIColor(netHex: 0x707070)
    @IBInspectable var fontCol: UIColor = UIColor(netHex: 0x707070)
    @IBInspectable var shadowCol: UIColor = UIColor(netHex: 0x707070)
    
    
    // MARK: - Properties
    var textFont = UIFont(name: "Helvetica Neue", size: 14.0)
    
    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor(red: 230, green: 230, blue: 230)
        self.layer.cornerRadius = 3.0
        self.tintColor = tintCol
        self.textColor = fontCol
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 255, green: 255, blue: 255).cgColor
        
        if let phText = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: phText, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0xB3B3B3)])
        }
        
        if let fnt = textFont {
            self.font = fnt
        } else {
            self.font = UIFont(name: "Helvetica Neue", size: 14.0)
        }
    }
    
    // Placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // Editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }

}
