//
//  FriendsTableViewController.swift
//  GithubFriends
//
//  Created by Shannon Armon on 5/12/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    
    @IBOutlet var friendNameField: UITextField!

 
    
    
    var friends: [[String: AnyObject?]] = [
    
        [
            "login": "ShannonArmon",
            "id": 12225207,
            "avatar_url": "https://avatars.githubusercontent.com/u/12225207?v=3",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ShannonArmon",
            "html_url": "https://github.com/ShannonArmon",
            "followers_url": "https://api.github.com/users/ShannonArmon/followers",
            "following_url": "https://api.github.com/users/ShannonArmon/following{/other_user}",
            "gists_url": "https://api.github.com/users/ShannonArmon/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ShannonArmon/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ShannonArmon/subscriptions",
            "organizations_url": "https://api.github.com/users/ShannonArmon/orgs",
            "repos_url": "https://api.github.com/users/ShannonArmon/repos",
            "events_url": "https://api.github.com/users/ShannonArmon/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ShannonArmon/received_events",
            "type": "User",
            "site_admin": false,
            "name": "Shannon Armon",
            "company": "",
            "blog": "",
            "location": "Atlanta",
            "email": "",
            "hireable": false,
            "bio": nil,
            "public_repos": 1,
            "public_gists": 0,
            "followers": 9,
            "following": 11,
            "created_at": "2015-05-03T21:22:11Z",
            "updated_at": "2015-05-04T18:11:52Z"
        ]
    
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    @IBAction func addFriend(sender: AnyObject) {
        
        // 'https://api.github.com/users/whatever?client_id=xxxx&client_secret=yyyy'
        
        let endpoint = "https://api.github.com/users/\(friendNameField.text)"
        
        println(endpoint)
        
        if let friendInfo = GithubRequest.getInfoWithEnpoint(endpoint) as? [String:AnyObject]{
        
            println(friendInfo)
            
            friends.insert(friendInfo, atIndex: 0)
            tableView.reloadData()
        }
        
       
        
        friendNameField.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return friends.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! ProfilePicTableViewCell
        
        

//        // This creates a label
////        cell.textLabel?.text = friends[indexPath.row]["name"] as? String
//        
//        // Access the new property of ProfilePicTableViewCell
//        cell.profileNameLabel.text = friends[indexPath.row]["name"] as? String
//        
//        // Gets the avatar URL for the friend
//        let avatarURL = NSURL(string: friends[indexPath.row]["avatar_url"]! as! String)
//        
//        // Gets the image data
//        let imageData = NSData(contentsOfURL: avatarURL!)
//        
//        // Create an image from the data
//        let image = UIImage(data: imageData!)
//        
//        cell.profilePic!.image = image
////        cell.imageView!.image = image
        
        
         // Configure the cell...
        
        cell.friendIndex = indexPath.row
        
        cell.friendInfo = friends[indexPath.row]
        

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            friends.removeAtIndex(indexPath.row)
            
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var reposTVC = segue.destinationViewController
        as! ReposTableViewController
        
        var repoButton = sender as! UIButton
        
        reposTVC.friendInfo = friends[repoButton.tag]
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


}
