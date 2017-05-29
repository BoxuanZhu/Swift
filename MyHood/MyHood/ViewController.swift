//
//  ViewController.swift
//  MyHood
//
//  Created by Boxuan Zhu on 5/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func onPostsLoaded(_ notif: AnyObject){
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as!PostCell
        //cell.configureCell(posts[0])
        //return cell
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell{
            cell.configureCell(post)
            return cell
        }
        return PostCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailPost"){
            let indexPath = self.tableView.indexPathForSelectedRow
            let indexNum = indexPath?.row
            let vc = segue.destination as! DetailPost
            vc.rowIndex = indexNum
        }
    }
 

    @IBAction func cameraBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddPostVC", sender: self)
    }
    
    
}

