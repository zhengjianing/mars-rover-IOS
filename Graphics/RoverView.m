//
//  RoverView.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "RoverView.h"

@implementation RoverView

- (id)initWithRover:(RoverModel *)rover;{
    self = [super init];
    if (self) {
        self.rover = rover;
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//}

@end
