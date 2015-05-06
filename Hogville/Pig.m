//
//  Pig.m
//  Hogville
//
//  Created by giaunv on 5/7/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import "Pig.h"

static const int POINTS_PER_SEC = 80;

@implementation Pig{
    NSMutableArray *_wayPoints;
    CGPoint _velocity;
}

-(instancetype)initWithImageNamed:(NSString *)name{
    if (self = [super initWithImageNamed:name]) {
        _wayPoints = [NSMutableArray array];
    }
    
    return self;
}

-(void)addPointToMove:(CGPoint)point{
    [_wayPoints addObject:[NSValue valueWithCGPoint:point]];
}

-(void)move:(NSNumber *)dt{
    CGPoint currentPosition = self.position;
    CGPoint newPosition;
    
    if ([_wayPoints count] > 0){
        CGPoint targetPoint = [[_wayPoints firstObject] CGPointValue];
        
        CGPoint offset = CGPointMake(targetPoint.x - currentPosition.x, targetPoint.y - currentPosition.y);
        CGFloat length = sqrtf(offset.x * offset.x + offset.y * offset.y);
        CGPoint direction = CGPointMake(offset.x/length, offset.y/length);
        _velocity = CGPointMake(direction.x * POINTS_PER_SEC, direction.y * POINTS_PER_SEC);
        
        newPosition = CGPointMake(currentPosition.x + _velocity.x * [dt doubleValue], currentPosition.y + _velocity.y * [dt doubleValue]);
        self.position = newPosition;
        
        if(CGRectContainsPoint(self.frame, targetPoint)){
            [_wayPoints removeObjectAtIndex:0];
        }
    }
}
@end
