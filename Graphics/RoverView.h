//
//  RoverView.h
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rover.h"

@interface RoverView : UIImageView
@property (nonatomic) Rover *rover;
- (id)initWithRover:(Rover *)rover;
@end
