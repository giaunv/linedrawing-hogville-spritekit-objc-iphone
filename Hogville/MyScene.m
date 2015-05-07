//
//  MyScene.m
//  Hogville
//
//  Created by Main Account on 3/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "MyScene.h"
#import "Pig.h"

@implementation MyScene{
    Pig *_movingPig;
    NSTimeInterval _lastUpdateTime;
    NSTimeInterval _dt;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bg_2_grassy"];
        bg.anchorPoint = CGPointZero;
        [self addChild:bg];
        
        Pig *pig = [[Pig alloc] initWithImageNamed:@"pig_1"];
        pig.name = @"pig";
        pig.position = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
        [self addChild:pig];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject] locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchPoint];
    NSLog(@"%@", node.name);
    
    if ([node.name isEqualToString:@"pig"]) {
        [(Pig *)node addPointToMove:touchPoint];
        _movingPig = (Pig *)node;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInNode:self.scene];
    if (_movingPig) {
        [_movingPig addPointToMove:touchPoint];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    _dt = currentTime - _lastUpdateTime;
    _lastUpdateTime = currentTime;
    
    [self enumerateChildNodesWithName:@"pig" usingBlock:^(SKNode *node, BOOL *stop) {
        [(Pig *)node move:@(_dt)];
    }];
}

@end
