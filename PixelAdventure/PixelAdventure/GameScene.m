//
//  GameScene.m
//  PixelAdventure
//
//  Created by Shannon Armon on 6/8/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

{
    SKSpriteNode * pixel;
    
    CGFloat characterDirection;

}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    NSLog(@"%f %f",view.frame.size.width, view.frame.size.height);
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:view.frame]; //view.frame gives a frame of the screen
   
//    SKFieldNode * field = [SKFieldNode radialGravityField];
    
//    //field
//    
//    field.position = view.center;
//    field.strength = 100;
//    
//    [self addChild:field];
//    
//    self.backgroundColor = [UIColor blackColor];
//
    
    pixel = [SKSpriteNode spriteNodeWithImageNamed:@"shooterPic.png"];
    
//    pixel.fillColor = [UIColor cyanColor];
//    pixel.strokeColor = [UIColor clearColor];

    
    pixel.position = CGPointMake(10, 10);//physicsBody gives gravity
    
    pixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
//    pixel.physicsBody.friction = 10;
    
    
    [self addChild:pixel];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        
//        CGPoint location = [touch locationInNode:self];
//        
//       
//        
//    }
// changes pixel direction to move left and right
-(void)changePixelDirection:(CGFloat)direction {

//    NSLog(@"%f", direction);
    characterDirection = direction;


}

//allows pixel to jump
- (void)movePixelInDirection:(CGVector)direction {
    
//    [pixel.physicsBody applyImpulse:direction];
//      [pixel.physicsBody applyForce:direction];
    
    CGFloat newX = pixel.position.x + direction.dx;
    CGFloat newY = pixel.position.y + direction.dy;
    
    pixel.position = CGPointMake(newX, newY);

}

-(void)normalAttack {

    SKShapeNode * babyPixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(2,2)];
        
        babyPixel.fillColor = [UIColor magentaColor];
        babyPixel.strokeColor = [UIColor clearColor];
        
        babyPixel.position = CGPointMake(pixel.position.x + 10, pixel.position.y);
        
        [self addChild:babyPixel];
        
    babyPixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    babyPixel.physicsBody.affectedByGravity = NO;
    
    [babyPixel.physicsBody applyImpulse:CGVectorMake(0.1, 0)];
    
    
    
    }


-(void)specialAttack {
    
    SKAction * soundEffect = [SKAction playSoundFileNamed:@"fireball.wav" waitForCompletion:NO];
    
    [ self runAction:soundEffect];
    
    SKEmitterNode * fireBall = [SKEmitterNode nodeWithFileNamed:@"Attack"];

    
    fireBall.position = CGPointMake(pixel.position.x + 10, pixel.position.y);
    
    [self addChild:fireBall];
    
    fireBall.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    fireBall.physicsBody.affectedByGravity = NO;
    
    [fireBall.physicsBody applyImpulse:CGVectorMake(0.1, 0)];
}



-(void)update:(CFTimeInterval)currentTime {
    
    //sets up when the move buttons are pressed
    pixel.position = CGPointMake(pixel.position.x + characterDirection, pixel.position.y);
    
    /* Called before each frame is rendered */
    
    
}

@end
