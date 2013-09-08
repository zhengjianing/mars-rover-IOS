//
//  RoverView.h
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoverModel.h"

@interface RoverView : UIView

@property (nonatomic) RoverModel *rover;

- (id)initWithRover:(RoverModel *)rover;
@end
