//
//  NotesTableViewController.swift
//  CoreNotes
//
//  Created by Shannon Armon on 6/23/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import CoreData


//4
// fetch all categories (set a local array to returned objects)
// per category fetch notes that have the category(adding an array of notes returned)


// add a section title based on category name

class NotesTableViewController: UITableViewController {
    
    var notes: [[NSManagedObject]] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let moc = appDelegate.managedObjectContext {
            
            let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: moc)
            
            let request = NSFetchRequest()
            
            request.entity = entity
            
            if let objects = moc.executeFetchRequest(request, error: nil) as? [NSManagedObject] {
                
                
                notes = []
                notes.append(objects)
                
                tableView.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return notes.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return notes[section].count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath) as! UITableViewCell

        let note = notes[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = note.valueForKey("content") as? String

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
            
            let note = notes[indexPath.section][indexPath.row]
            
            appDelegate.managedObjectContext?.deleteObject(note)
            appDelegate.saveContext()
            
            notes[indexPath.section].removeAtIndex(indexPath.row)
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
