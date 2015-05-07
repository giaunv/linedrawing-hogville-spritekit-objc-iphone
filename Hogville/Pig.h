//
//  Pig.h
//  Hogville
//
//  Created by giaunv on 5/7/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Pig : SKSpriteNode
-(void)addPointToMove:(CGPoint)point;
-(void)move:(NSNumber *)dt;
-(CGPathRef)createPathToMove;
@end
