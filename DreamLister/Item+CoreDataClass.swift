//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Boxuan Zhu on 6/26/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
