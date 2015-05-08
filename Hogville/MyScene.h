//
//  MyScene.h
//  Hogville
//

//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_OPTIONS(uint32_t, LDPhysicsCategory) {
    LDPhysicsCategoryAnimal = 1 << 0,
    LDPhysicsCategoryFood = 1 << 1
};

@interface MyScene : SKScene

@property (nonatomic, strong) SKSpriteNode *homeNode;

@end
