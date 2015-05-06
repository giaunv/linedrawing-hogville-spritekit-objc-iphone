//
//  MyScene.m
//  Hogville
//
//  Created by Main Account on 3/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bg_2_grassy"];
        bg.anchorPoint = CGPointZero;
        [self addChild:bg];
        
        SKSpriteNode *pig = [SKSpriteNode spriteNodeWithImageNamed:@"pig_1"];
        pig.position = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
        [self addChild:pig];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    }

-(void)update:(CFTimeInterval)currentTime {
    
}

@end
