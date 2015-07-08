//
//  ViewController.swift
//  Favorites
//
//  Created by Shannon Armon on 5/28/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myFavorites: [PFObject] = []
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    @IBOutlet weak var favorieTextField: UITextField!
    
    @IBAction func addFavorite(sender: AnyObject) {
        
        let newFavorite = PFObject(className: "Favorites")
        
        newFavorite["name"] = favorieTextField.text
        newFavorite["user"] = PFUser.currentUser()
        
        newFavorite.saveInBackground()
        
         myFavorites.append(newFavorite)
        self.favoritesTableView.reloadData()
        
        favorieTextField.text = ""
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        let query = PFQuery(className: "Favorites")
        
        query.orderByDescending("CreatedAt")
        
    
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            self.myFavorites = objects as! [PFObject]
            self.favoritesTableView.reloadData()
            
            
        }
        
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            
            let query = PFQuery(className: "user")
            
            query.delete("user")  /// Do stuff with the user
            
        } else {
            // Show the signup or login screen
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFavorites.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
                tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = myFavorites[indexPath.row]["name"] as? String
        
        return cell
        
    }

}

