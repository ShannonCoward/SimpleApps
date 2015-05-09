//: Playground - noun: a place where people can play

import UIKit



class BodyParts {

    var type = ""
    var muscleDefinition = ""
    var flexibility  = ""
    

}



class Arms: BodyParts {
    
    var hands = 10
    var tattoos = true
    var musles = true
    
}



class Hands: BodyParts {
    var fingers = 10
}


class Fingers: BodyParts {
    var fingerNails = 10
}

class FingerNails: Fingers {
        var length = "long"
}


class MiddleFinger: Fingers {
    var flippingTheBird = true
}


class Legs: BodyParts {
    
    var toes = 10
    var calfMuscles = 2
    var knees = 2

}

class Ears: BodyParts {
    var pierced = true
}

class Knees: BodyParts{

}

class Feet: BodyParts {
    var ankles = 10
}



class Toes: Feet {
    var heels = 2
}


class Ankles: Feet {
    
    var size = "small"
}


class Head: BodyParts{
    
    var largeHead = true
    var eyeColor = UIColor(red: 00.2, green: 00.3, blue: 00.3, alpha: 00.3)
    var shape = "round"
}

class Mouth: BodyParts {
    
}

class Nose: BodyParts {
    
}


class Eyes: Head {
    var color = "Brown"
}

class Neck: BodyParts {
    
    
}






