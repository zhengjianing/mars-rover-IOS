//
//  GraphicsViewControllerView.h
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphicsViewControllerView : UIView
@property (nonatomic, strong) UIImage *backgroundImage;

- (id)initWithImage:(UIImage *)backgroundImage;
@end
