//
//  CreateNoteViewController.swift
//  CoreNotes
//
//  Created by Shannon Armon on 6/23/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import CoreData

var appDelegate: AppDelegate = {

    return (UIApplication.sharedApplication().delegate as! AppDelegate)
    
    
}()

//var moc: NSManagedObjectContext? = {
//    
//    return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//    
//    
//    }()

class CreateNoteViewController: UIViewController {

    
    @IBOutlet weak var notTextField: UITextField!
    
    @IBAction func createNote(sender: UIButton) {
        
//            let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        if let moc = appDelegate.managedObjectContext {
            var newObject = NSEntityDescription.insertNewObjectForEntityForName("note", inManagedObjectContext: moc) as! NSManagedObject
        
            
            newObject.setValue(notTextField.text, forKey: "content")
            newObject.setValue(NSDate(), forKey: "created")
            
            appDelegate.saveContext()
        
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}