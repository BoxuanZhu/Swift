//
//  PostCell.swift
//  MyHood
//
//  Created by Boxuan Zhu on 5/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    fileprivate var _imagePath: String!
    fileprivate var _title: String!
    fileprivate var _postDesc: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImg.layer.cornerRadius = 15
    }
    
    func configureCell(_ post: Post){
        descLbl.text = post.postDesc
        titleLbl.text = post.title
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }
    

}
