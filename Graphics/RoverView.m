//
//  RoverView.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "RoverView.h"

@implementation RoverView

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

//- (void)drawRect:(CGRect)rect
//{
//}

@end
