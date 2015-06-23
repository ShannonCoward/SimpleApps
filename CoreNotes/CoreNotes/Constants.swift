//
//  Constants.swift
//  CoreNotes
//
//  Created by Shannon Armon on 6/23/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

let DEBUG = true


let categories: [String:(String,UIColor)] = [

    "Red" : ("LAVA", UIColor(red:1, green: 0.24, blue:0.11, alpha:1)),
    "Cyan" : ("Sky",UIColor.cyanColor()),
    "Yellow" : ("Lazy",UIColor.yellowColor()),
    "Purple" : ("Unicorn",UIColor.purpleColor()),
    "Orange" : ("Fruit", UIColor.orangeColor())

]

func categoryColor(name: String) -> UIColor {
    
    return categories[name]!.1

}

//func getColor(color: String) -> UIColor {
//    
//    
//    switch color {
//        
//    case "red" :
//        
//        return UIColor.redColor()
//        
//    case "blue":
//        
//        return UIColor.blueColor()
//        
//    case "yellow":
//        
//        return UIColor.yellowColor()
//        
//    case "green":
//        
//        return UIColor.greenColor()
//        
//    default :
//        
//        return UIColor.whiteColor()
//        
//    }
//}
//



//2
//create a global function that returns a UIColor based on a String