//
//  ViewController.swift
//  Review
//
//  Created by Shannon Armon on 6/16/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // if user == nil
        
        let loginStoryBoard = UIStoryboard(name: "LoginStoryBoard", bundle: nil)
        
        let loginViewController = loginStoryBoard.instantiateInitialViewController() as! UIViewController
        
        presentViewController(loginViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

