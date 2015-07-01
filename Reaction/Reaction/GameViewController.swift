//
//  GameViewController.swift
//  Reaction
//
//  Created by Shannon Armon on 7/1/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var currentCircles: [CircleButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateNewCirclesIn()

    }

    func animateNewCirclesIn() {
        
        var  circleWidth = (view.frame.width - 120) / 2
        var  circleRadius = circleWidth / 2
    
        var directions: [(CGFloat,CGFloat)] = [(-1,-1),(1,-1),(-1,1),(1,1)]
        
        
        for c in 0..<4 {  //ADDS Four Circles
        
            var circle = CircleButton()
            circle.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            circle.center = view.center
            view.addSubview(circle)
            
            currentCircles.append(circle)
            
            let (dx,dy) = directions[c]
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                circle.frame.size.width = circleWidth
                circle.frame.size.height  = circleWidth
                
                let x = self.view.center.x + dx * (circleRadius + 10)
                 let y = self.view.center.y + dy * (circleRadius + 10)
                
                circle.center = CGPoint(x: x, y: y)
            })
        
        }
    }
    
    
    func animateOldCirclesOut() {
    
    
         var circleWidth = (view.frame.width - 120) / 2 * 3
        
            for circle in currentCircles {
                
                let distX = circle.center.x - view.center.x
                let distY = circle.center.y - view.center.y
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
               
                circle.frame.size.width = circleWidth
                circle.frame.size.height = circleWidth
                
                circle.center = CGPoint(x: distX * 4 + self.view.center.x, y: distY * 6 + self.view.center.y)
                
            }, completion: { (finished) -> Void in
                
                circle.removeFromSuperview()
                
            })
        
        }
        
    }
    
    override func  touchesBegan(touches: Set<NSObject>, withEvent: UIEvent){
        
        animateOldCirclesOut()
        
        currentCircles = []
        
        animateNewCirclesIn()
        
    
    }
        
    
    func endGame() {
    
        if let startVC = storyboard?.instantiateInitialViewController() as?
            ViewController {
                
                navigationController?.viewControllers = [startVC]
                
        }
    
    }
  }
