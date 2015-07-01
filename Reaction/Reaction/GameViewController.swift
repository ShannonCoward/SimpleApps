//
//  GameViewController.swift
//  Reaction
//
//  Created by Shannon Armon on 7/1/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import GameKit


class GameViewController: UIViewController {
    
   
    
    var currentScore = 0 {
    
        didSet { scoreLabel.text = "\(currentScore)" }
    
    }
   
    var scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    
    var timerBar = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))

    var currentCircles: [CircleButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerBar.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(timerBar)
        
        scoreLabel.textColor = UIColor.whiteColor()
        scoreLabel.font = UIFont(name: "HelveticaNeue-Ultralight", size: 80)
        scoreLabel.text = "0"
        scoreLabel.frame.origin.y = view.frame.height - 120
        scoreLabel.frame.size.width = view.frame.width
        scoreLabel.textAlignment = .Center
        
        view.addSubview(scoreLabel)
        
        animateNewCirclesIn()

    }
    
    func runTimer(seconds: NSTimeInterval) {
    
        
        timerBar.layer.removeAllAnimations()
        
        timerBar.frame.size.width = view.frame.width
        UIView.animateWithDuration(seconds, animations: { () -> Void in
            
            self.timerBar.frame.size.width = 0
            
        }) { (finished) -> Void in
        
            if finished { self.endGame() }
            
        }
    
    }

    func animateNewCirclesIn() {
        
        runTimer(1.0)
        
        var  circleWidth = (view.frame.width - 120) / 2
        var  circleRadius = circleWidth / 2
    
        var directions: [(CGFloat,CGFloat)] = [(-1,-1),(1,-1),(-1,1),(1,1)]
        
        
        for c in 0..<4 {  //ADDS Four Circles
        
            var circle = CircleButton()
            circle.choice = c
            circle.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            circle.center = view.center
            view.addSubview(circle)
            
            circle.alpha = c == currentCorrectChoice ? 1.0 : 0.5
            
            
            circle.addTarget(self, action: "tapCircle:", forControlEvents: .TouchUpInside)
            
            currentCircles.append(circle)
            
            let (dx,dy) = directions[c]
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                
                circle.alpha = 0.5
                
                circle.frame.size.width = circleWidth
                circle.frame.size.height  = circleWidth
                
                let x = self.view.center.x + dx * (circleRadius + 10)
                let y = self.view.center.y + dy * (circleRadius + 10)
                circle.center = CGPoint(x: x, y: y)

            }, completion: nil)
            
        
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
    
    var currentCorrectChoice: Int = Int(arc4random_uniform(4))
    
    func tapCircle(circle: CircleButton) {
        
        if circle.choice == currentCorrectChoice {
            
            currentScore++
            
            //report score to leaderboard
            
            let reportScore = GKScore(leaderboardIdentifier: "circles_touched")
            
            reportScore.value = Int64(currentScore)
            
            GKScore.reportScores([reportScore], withCompletionHandler: { (error) -> Void in
                
                println("reported")
            
            })
        
        currentCorrectChoice = Int(arc4random_uniform(4))
    
        animateOldCirclesOut()
        currentCircles = []
        animateNewCirclesIn()
            
        } else {
        
            endGame()
        
        }
    
    }
        
    
    func endGame() {
    
        if let startVC = storyboard?.instantiateViewControllerWithIdentifier("startVC") as? ViewController {
                
                navigationController?.viewControllers = [startVC]
                
        }
    
    }
  }
