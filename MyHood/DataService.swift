//
//  DataService.swift
//  MyHood
//
//  Created by Boxuan Zhu on 5/28/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post]{
        return _loadedPosts
    }
    
    func savePosts(){
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postsData, forKey: "posts")
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts(){
        if let postData = UserDefaults.standard.object(forKey: "posts") as? Data{
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postData) as? [Post]{
                _loadedPosts = postsArray
            }
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(imgPath)
        try? imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
        return imgPath
        
    }
    
    func imageForPath(_ path: String) -> UIImage?{
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post){
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(_ name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
}
