//
//  ViewController.swift
//  SimpleButtons
//
//  Created by Shannon Armon on 5/4/15.
//  Copyright (c) 2015 RarefiedProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = 00
    var secondNumber = 00
    
    var currentOperation = ""
    let perccentCalc: Double = 0.01
    let decimal = "."
    let negative = -1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   }
    
    
    
    @IBOutlet weak var screen: UILabel!
    
    
    
    
    @IBAction func pushButton(sender: UIButton) {
        
        let number = sender.currentTitle!.toInt()!
        
        if currentOperation.isEmpty {
            firstNumber += number
            println(firstNumber)
            screen.text = "\(firstNumber)"
            
        } else {
            
            secondNumber += number
            println(secondNumber)
            screen.text = "\(secondNumber)"
            
        }
    }
    
    
    @IBAction func allClear(sender: UIButton) {
        
        let value = 0
        screen.text = "\(value)"
    }
    

    @IBAction func currentOperations(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        println(operation)
        
        if operation != "=" {
            
            currentOperation = operation
            
        } else {
            
            println(currentOperation)
            
            switch currentOperation {
                
            case "+":

                
                let value = firstNumber + secondNumber
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                    screen.text = "\(value)"

                
            case "-":
                
                let value = firstNumber - secondNumber
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                    screen.text = "\(value)"
                
                
            case "x":

                let value = firstNumber * secondNumber
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                    screen.text = "\(value)"
                
            
            case "/":

                let value = firstNumber / secondNumber
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                    screen.text = "\(value)"
               
                
            default:

                println("blah")
                
                
            }
            
            firstNumber = 00
            secondNumber = 00
            currentOperation = ""
        
        }

    }

}
