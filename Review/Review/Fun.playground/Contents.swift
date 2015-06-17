//: Playground - noun: a place where people can play

import UIKit

class Shape {
    
    var size: CGSize!
    
    var area: CGFloat {
        
        return size.width * size.height
        
        
    }
    
}

class Square: Shape {


}


extension Array {
    


//    func middle() -> T {   Functions
    
    var middle: T {  //<======computed properties(Read Only)
    
        let even = count % 2 == 0

        let middleIndex = even ? count / 2 - 1 : count / 2
        
        return self[middleIndex]
    
    }

}

var ages = [12,24,53,15,9,27,32]

var friends = ["Jim","Bob","Sally"]

ages.last

ages.first

ages.count

ages.middle //()

friends.middle  //()


protocol Baseball {
    
    var threadCount: Int { get set }
 
    func caughtInOutfield()
}


protocol Ball: Baseball {
    
    var threadCount: Int = 4
    
    func override caughtInOutfield() {
    
    }
    

}
