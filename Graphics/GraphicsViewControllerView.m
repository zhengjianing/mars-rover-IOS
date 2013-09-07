//
//  GraphicsViewControllerView.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "GraphicsViewControllerView.h"

@interface GraphicsViewControllerView ()
@end

@implementation GraphicsViewControllerView

- (id)initWithImage:(UIImage *)backgroundImage
{
    self = [super init];
    if (self) {
        self.backgroundImage = backgroundImage;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self.backgroundImage drawAtPoint:CGPointMake(0.0f, 0.0f)];
}

@end
