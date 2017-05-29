//
//  Post.swift
//  MyHood
//
//  Created by Boxuan Zhu on 5/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding{
    
    fileprivate var _title: String!
    fileprivate var _imagePath: String!
    fileprivate var _postDesc: String!
    
    init(imagePath: String, title: String, postDesc: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = postDesc
    }
    
    override init() {
        
    }

    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._postDesc, forKey: "description")
        aCoder.encode(self._title, forKey: "title")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = (aDecoder.decodeObject(forKey: "imagePath") as? String)!
        self._postDesc = (aDecoder.decodeObject(forKey: "description") as? String)!
        self._title = (aDecoder.decodeObject(forKey: "title") as? String)!
    }
    
    var imagePath: String{
        return _imagePath
    }
    var title: String {
        return _title
    }
    var postDesc: String {
        return _postDesc
    }
}
