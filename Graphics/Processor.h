//
//  Processor.h
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rover.h"

@interface Processor : NSObject
- (void)moveForward:(Rover *)rover;
- (void)turnLeft:(Rover *)rover;
- (void)turnRight:(Rover *)rover;
- (void)changeSpeed:(NSString *)operation forRover:(Rover *)rover;
@end
