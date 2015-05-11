//
//  ListTableViewCell.swift
//  HighPriority
//
//  Created by Shannon Armon on 5/11/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    
    let priorityColors = [
        
        UIColor.redColor(),
        UIColor.orangeColor(),
        UIColor.blueColor(),

    ]
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemStrikeThrough: UIView!
    
    var itemInfo: [String:AnyObject]! { //<== pass the dictionary to the cell

        didSet {                            //<===Property Observer of Item Info
        
            itemLabel.text = itemInfo["name"] as? String
            itemStrikeThrough.hidden = !(itemInfo["completed"] as! Bool)//!is Reverse
            
            backgroundColor = priorityColors[itemInfo["priority"] as! Int]
            
        }
    
    }

        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent){
    
        itemInfo["completed"] = !(itemInfo["completed"] as! Bool)
    
        if itemInfo["completed"] as! Bool {
    
        itemStrikeThrough.hidden = false
        backgroundColor = UIColor.lightGrayColor()
    
    } else {
    
        itemStrikeThrough.hidden = true
        backgroundColor = priorityColors[itemInfo["priority"] as! Int]
    
      }
    
    }
    
}

