//
//  ViewController.swift
//  TicTacToeLayOut
//
//  Created by Shannon Armon on 5/8/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var spaces: [[Player?]] =  [
    
            [nil,nil,nil],
            [nil,nil,nil],
            [nil,nil,nil]
    
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var scoreCard: UIButton!
    
  
        var currentPlayer: Player = .One

    @IBAction func buttonPressed(sender: TicButton) {
        
        if sender.player != nil {return}
        
        sender.player = currentPlayer
        sender.setNeedsDisplay()
        
        spaces[sender.row][sender.col] = currentPlayer
        
        println(spaces)
        
        checkForWinner()
        
//        if currentPlayer == .One {
//            currentPlayer == .Two
//            
//        } else {
//        
//            currentPlayer == .One
//        
//        }
        
        currentPlayer = (currentPlayer == .One) ? .Two : .One
        
        
    }
    
    var possibilites = [
    
       [0,0,0,1,0,2],
       [1,0,1,1,1,2],
       [2,0,2,1,2,2],
       [0,0,1,0,2,0],
       [0,1,1,1,2,1],
       [0,2,1,2,2,2],
       [0,2,1,1,2,0],
       [0,0,1,1,2,2],
    
    ]
    
    func checkForWinner() {
        
        
        for possibility in possibilites {
        
            let firstspot = spaces[possibility[0]][possibility[1]]
            let secondSpot = spaces[possibility[2]][possibility[3]]
            let thirdSpot = spaces[possibility[4]][possibility[5]]
            
            if firstspot == secondSpot && secondSpot == thirdSpot {
                
                if let winner = firstspot {

                    println("player \(winner.hashValue + 1) wins")

                }
             
            }
        
//        var player1Win = spaces[0][0] == spaces [0][1] && spaces [0][1] ==
//            spaces[0][1] && spaces [0][02 == .One
//        
//        var player2Win = spaces[0][0] == spaces [0][1] && spaces [0][1] ==
//            spaces[0][2] && spaces [0][0] == .Two
        
        
        }
        
    }
    
   
}

