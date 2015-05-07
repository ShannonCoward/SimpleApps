//: Playground - noun: a place where people can play

import UIKit



class BodyParts {

    var type = ""
    var muscleDefinition = ""
    var flexibility  = ""
    

}

class Arms {
    
    var hands = 10
    var tattoos = true
    var musles = true
    
}

class Hands: Arms {
    var fingers = 10
}


class Fingers: Hands {
    var fingerNails = 10
}


class Legs {
    
    var toes = 10
    var calfMuscles = 2
    var knees = 2

}

class Feet: Legs {
    var ankles = 10
}

class Toes: Feet {
    var heels = 2
}


class Head {
    
    var largeHead = true
    var eyeColor = UIColor(red: 00.2, green: 00.3, blue: 00.3, alpha: 00.3)
    var shape = "round"
}

class Eyes: Head {
    var color = "Brown"
}



