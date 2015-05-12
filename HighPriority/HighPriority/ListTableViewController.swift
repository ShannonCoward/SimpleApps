//
//  ListTableViewController.swift
//  HighPriority
//
//  Created by Shannon Armon on 5/11/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

enum Priority {
    
    case High
    case Medium
    case Low


}



class ListTableViewController: UITableViewController {
    
    @IBAction func highButton(sender: AnyObject) {
        

        
        priorityLevel = 0
        
    }
    
    @IBAction func mediumButton(sender: AnyObject) {
        
        priorityLevel = 1
        
    }
    
    
    @IBAction func lowButton(sender: AnyObject) {
        
        priorityLevel = 2
    }
    
    var priorityLevel = 0
    
    
    // [String]
    // [String:String] <---- Dictionary  //array of dictionaries
    
    var listItems: [[String:AnyObject]] = [
    
        [
        
            "name" : "Sleep",
            "timecreated" : NSDate(),
            "priority" : 0,
            "completed" : false
            
        ],
    
    
        [
            "name" : "Get Rat Food",
            "timecreated" : NSDate(),
            "priority" : 0,
            "completed" : false
            
    
        ]
   
    
    ]
    
    
    
    
    @IBOutlet var itemName: UITextField!
    
    @IBAction func createItem(sender: AnyObject) {
        
        var itemInfo = [
        
            "name" : itemName.text,
            "timecreated" : NSDate(),
            "priority" : priorityLevel,
            "completed" : false
        
        
        ]
        
        listItems.append(itemInfo)
        
        tableView.reloadData()
        
//        println(listItems.count)
        
    }
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return listItems.count        //<==== Makes dynamic and updates
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as! ListTableViewCell
        
        cell.itemInfo = listItems[indexPath.row]   //<===Setting a Value

//        cell.textLabel?.text = listItems[indexPath.row]["name"] as?
//            String; <== To see if it works
        
        
//        cell.itemLabel.text = listItems[indexPath.row]["name"] as? String
        
//         Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
