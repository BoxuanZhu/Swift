//
//  Image+CoreDataProperties.swift
//  DreamLister
//
//  Created by Boxuan Zhu on 6/26/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var item: Item?
    @NSManaged public var store: Store?

}
