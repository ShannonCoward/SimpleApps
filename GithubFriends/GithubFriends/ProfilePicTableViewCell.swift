//
//  ProfilePicTableViewCell.swift
//  GithubFriends
//
//  Created by Shannon Armon on 5/12/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ProfilePicTableViewCell: UITableViewCell {
    

    @IBAction func reposButton(sender: AnyObject) {
        
    }
    
    
    @IBAction func getsButton(sender: AnyObject) {
    }
    
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var profilePic: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
