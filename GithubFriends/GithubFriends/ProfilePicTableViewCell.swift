//
//  ProfilePicTableViewCell.swift
//  GithubFriends
//
//  Created by Shannon Armon on 5/12/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ProfilePicTableViewCell: UITableViewCell {
    
    var friendIndex: Int!
    
    var friendInfo: [String: AnyObject?]! {
        
        didSet {
            
            repoButton.tag = friendIndex
            gistsButton.tag = friendIndex
    
            profileNameLabel.text = friendInfo["name"] as? String
            
            let repoCount = friendInfo["public_repos"] as! Int
            repoButton.setTitle("Repos \(repoCount)", forState: .Normal)
        
            let gistCount = friendInfo["public_repos"] as! Int
            gistsButton.setTitle("Repos \(gistCount)", forState: .Normal)
            
            let avatarURL = friendInfo["avatar_url"] as! String
            
            let url = NSURL(string: avatarURL)!
            
            let data = NSData(contentsOfURL: url)!
            
            let  image = UIImage(data: data)
            
                profilePic.image = image
            
                profilePic.layer.cornerRadius = 30
                profilePic.layer.masksToBounds = true
    
        }
    }
 
    @IBOutlet var profileNameLabel: UILabel!
    
    @IBOutlet var profilePic: UIImageView!
    
    @IBOutlet var repoButton: UIButton!
    
    @IBOutlet var gistsButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
