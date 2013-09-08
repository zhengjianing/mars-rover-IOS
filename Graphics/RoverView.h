//
//  RoverView.h
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoverView : UIView

@property (nonatomic) NSInteger positionX;
@property (nonatomic) NSInteger positionY;
@property (nonatomic, strong) NSString *facing;

- (id)initAtPositionX:(CGFloat)positionX atPositionY:(CGFloat)positionY facing:(NSString *)orientation;
@end
