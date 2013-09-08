//
//  Processor.m
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "Processor.h"

@implementation Processor

- (void)moveForward:(Rover *)rover
{
    if ([rover.facing isEqualToString:@"N"] && rover.positionY > 0) {
        rover.positionY = rover.positionY - 50.0f;
    }
    else if ([rover.facing isEqualToString:@"S"] && rover.positionY < 320) {
        rover.positionY = rover.positionY + 50.0f;
    }
    else if ([rover.facing isEqualToString:@"W"] && rover.positionX < 271) {
        if (rover.positionX > 230) {
            rover.positionX = rover.positionX + 30.0f;
        } else {
            rover.positionX = rover.positionX + 50.0f;
        }
    }
    else if ([rover.facing isEqualToString:@"E"] && rover.positionX > 0) {
        if (rover.positionX < 50) {
            rover.positionX = rover.positionX - 30.0f;
        } else {
            rover.positionX = rover.positionX - 50.0f;
        }
    }
}

- (void)turnLeft:(Rover *)rover
{
    if ([rover.facing isEqualToString:@"N"]) {
        rover.facing = @"W";
    }
    else if ([rover.facing isEqualToString:@"W"]) {
        rover.facing = @"S";
    }
    else if ([rover.facing isEqualToString:@"S"]) {
        rover.facing = @"E";
    }
    else if ([rover.facing isEqualToString:@"E"]) {
        rover.facing = @"N";
    }
    rover.rotateDegree = rover.rotateDegree + 90.0f;
}

- (void)turnRight:(Rover *)rover
{
    if ([rover.facing isEqualToString:@"N"]) {
        rover.facing = @"E";
    }
    else if ([rover.facing isEqualToString:@"E"]) {
        rover.facing = @"S";
    }
    else if ([rover.facing isEqualToString:@"S"]) {
        rover.facing = @"W";
    }
    else if ([rover.facing isEqualToString:@"W"]) {
        rover.facing = @"N";
    }
    rover.rotateDegree = rover.rotateDegree - 90.0f;
}

- (void)changeSpeed:(NSString *)operation forRover:(Rover *)rover
{
    if ([operation isEqualToString:@"+"]) {
        rover.speed = rover.speed - 0.1f;
    } else if ([operation isEqualToString:@"-"]) {
        rover.speed = rover.speed + 0.1f;
    }
}
@end
