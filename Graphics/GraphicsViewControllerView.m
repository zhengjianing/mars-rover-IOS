//
//  GraphicsViewControllerView.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "GraphicsViewControllerView.h"

@implementation GraphicsViewControllerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
// 显示文字，修改字体颜色，样式
//    UIColor *myColor = [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1];
//    [myColor set];
//    
//    UIFont *myFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0f];
//    
//    NSString *myString = @"Hello world";
////    [myString drawAtPoint:CGPointMake(0, 180) withFont:myFont];
//    [myString drawInRect:CGRectMake(100, 120, 100, 200) withFont:myFont];
    
    
// 显示图片
    UIImage *roverImage = [UIImage imageNamed:@"rover.jpg"];
    if(roverImage!=nil){
        NSLog(@"load image success!");
    }else{
        NSLog(@"load image fail!");
    }
    [roverImage drawAtPoint:CGPointMake(0, 0)];
    
}


@end
