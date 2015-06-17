//
//  GameScene.h
//  PixelAdventure
//

//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

-(void)changePixelDirection:(CGFloat)direction; 
-(void)movePixelInDirection:(CGVector)direction;


-(void)normalAttack;
-(void)specialAttack;

@end