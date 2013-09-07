//
//  RoverView.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "RoverView.h"

@implementation RoverView

- (id)initWithImage:(UIImage *)image atPositionX:(CGFloat)positionX atPositionY:(CGFloat)positionY facing:(NSString *)orientation
{
    self = [super init];
    if (self) {
        self.roverImage = image;
        self.positionX = positionX;
        self.positionY = positionY;
        self.facing = orientation;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self.roverImage drawAtPoint:CGPointMake(self.positionX, self.positionY)];
}

@end
