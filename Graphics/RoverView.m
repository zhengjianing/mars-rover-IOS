//
//  RoverView.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "RoverView.h"

@implementation RoverView

- (id)init {
    self = [super init];
    if (self) {
        self.rover = [[RoverModel alloc] initAtPositionX:100.0f atPositionY:150.0f facing:@"N" withSpeed:1.0f andRotateDegree:0.0f];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//}

@end
