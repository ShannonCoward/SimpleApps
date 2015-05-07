//
//  ViewController.swift
//  CalculatorFunctions
//
//  Created by Shannon Armon on 5/5/15.
//  Copyright (c) 2015 RarefiedProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = ""
    var secondNumber = ""
    
    var currentOperation = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func pressedButton1(sender: UIButton) {
            //println(sender.currentTitle!)
        
        let number = sender.currentTitle!
        
        if currentOperation.isEmpty {
            
            firstNumber += number
            println(firstNumber)
        
        } else {
        
            secondNumber += number
            println(secondNumber)
        }
    }
    
    @IBAction func operatorPressed(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        if operation != "=" {
            
            currentOperation = operation
        
        } else {
            
            switch currentOperation {
                
            case "+":
                
                let value = firstNumber.toInt()! + secondNumber.toInt()!
                
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
                // do addition
                
                
                
            case "-":
                println("subtracting")
                // do subtraction
            default:
                println("blah")
                
                
            }
        
        
        }
        
        
   
        
//        if operation == "+" { //if we press + this happens
//            
//            // add number
//        }
//       
//        if operation == "-" { // if we press - this happens
//            // subtract number
//        }
//        
//        if operation == "=" {
//          // run equation
//        }
      
   }
    
}

