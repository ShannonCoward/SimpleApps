//
//  ViewController.swift
//  Reaction
//
//  Created by Shannon Armon on 7/1/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    @IBOutlet weak var topScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButton(sender: UIButton) {
        
       if let gameVC = storyboard?.instantiateViewControllerWithIdentifier("GameVC") as?
            GameViewController{
        
                navigationController?.viewControllers = [gameVC]
        
        }
    }
}



///////// PUT IN VIEW DID LOAD FOR A ANIMATED CIRCLE
//        var button = CircleButton()
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        button.center = view.center
//
////        button.fillColor = UIColor.whiteColor()
////        button.backgroundColor = UIColor.whiteColor()
//
//        view.addSubview(button)
//
//        UIView.animateWithDuration(1.0, animations: { () -> Void in
//
//            button.frame.size.width = 200
//            button.frame.size.height = 200
//            button.center = self.view.center
//        })
