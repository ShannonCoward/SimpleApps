//
//  MotionScene.swift
//  Level
//
//  Created by Shannon Armon on 6/29/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import SpriteKit

class MotionScene: SKScene {
    
    let dot = SKShapeNode(ellipseOfSize: CGSize(width: 40, height: 40))
    
    override func didMoveToView(view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        //SETS THE SIZE OF THE SCENE TO THE SIZE OF THE VIEW
        size = view.frame.size
        
        dot.fillColor = UIColor.whiteColor()
        dot.position = view.center
        addChild(dot)
        
        dot.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        
        physicsBody = SKPhysicsBody(edgeLoopFromRect: view.bounds)
    }
   
}


