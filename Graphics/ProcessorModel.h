//
//  ProcessorModel.h
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoverModel.h"

@interface ProcessorModel : NSObject
- (void)moveForward:(RoverModel *)rover;
- (void)turnLeft:(RoverModel *)rover;
- (void)turnRight:(RoverModel *)rover;
- (void)changeSpeed:(NSString *)operation forRover:(RoverModel *)rover;
@end
