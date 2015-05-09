//
//  TicButton.swift
//  TicTacToeLayOut
//
//  Created by Shannon Armon on 5/8/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

enum Player {
    
    case One
    case Two
    
}

@IBDesignable class TicButton: UIButton {
    
    @IBInspectable var row: Int = 0
    @IBInspectable var col: Int = 0
    
    var player: Player?
   
    

    override func drawRect(rect: CGRect) {
        
        
        var context = UIGraphicsGetCurrentContext()
        
        var insetRect = CGRectInset(rect, 1, 1)
        
        UIColor.lightGrayColor().set()
        
        
        CGContextSetLineWidth(context, 1)
        
        CGContextStrokeEllipseInRect(context, insetRect)
        
        
        if let playerUnwrapped = player {
            
            UIColor.orangeColor().set()
            
            if playerUnwrapped == .Two{
                
                UIColor.greenColor().set()
            
            }
            
            var smallCircleREct = CGRectInset(rect, 40 ,40)
            CGContextFillEllipseInRect(context, smallCircleREct)
        
        }
        
        
    }

}
