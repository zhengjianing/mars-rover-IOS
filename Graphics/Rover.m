//
//  Rover.m
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "Rover.h"

@implementation Rover

- (id)initAtPositionX:(CGFloat)positionX atPositionY:(CGFloat)positionY facing:(NSString *)orientation withSpeed:(CGFloat)speed andRotateDegree:(CGFloat)rotateDegree
{
    self = [super init];
    if (self) {
        self.positionX = positionX;
        self.positionY = positionY;
        self.facing = orientation;
        self.speed = speed;
        self.rotateDegree = rotateDegree;
    }
    return self;
}

@end
