//
//  ViewController.swift
//  FromScratch
//
//  Created by Shannon Armon on 5/7/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        var view2 = UIView(frame: CGRectMake (150, 20, 100, 100))
        view2.backgroundColor = UIColor.yellowColor()
        
        var view = view2
        
  
        
        
        
      
//        view.addSubview(view2)
       
//        func drawRect(_ rect: CGRect)
//        view1.alpha = 0.5
        
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        for touch in touches as! Set<UITouch> {
            
            let location = touch.locationInView(view)
            
            println("x = \(location.x)and y = \(location.y)")
            
            var box = Swaggy()
            view.addSubview(box)
            box.center = location
            
        }
        
    }
    

}

//Normmal mode

// Make box a circle
// randomize the circle size (width will be same as height)
// Randomize the color of the circle (Use UIColor()
// Radomize the color of the circle
// Randomize the alpha of the circle


//Middle mode
//
// Transition to alpha 0 after 1 second

// Hard mode

//Randomize rotation of box
//Randomize whether it is round or not
//Randomize whether between full circle -> rounce square -> square


//UIViewAnimation
    