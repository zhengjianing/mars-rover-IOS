//
//  RoverModel.m
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "RoverModel.h"

@implementation RoverModel

- (id)initAtPositionX:(CGFloat)positionX atPositionY:(CGFloat)positionY facing:(NSString *)orientation
{
    self = [super init];
    if (self) {
        self.positionX = positionX;
        self.positionY = positionY;
        self.facing = orientation;
    }
    return self;
}

@end
