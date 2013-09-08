//
//  ProcessorModel.m
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "ProcessorModel.h"

@implementation ProcessorModel

- (void)moveForward:(RoverModel *)rover
{
    if ([rover.facing isEqualToString:@"N"] && rover.positionY > 0) {
        rover.positionY = rover.positionY - 50.0f;
    }
    else if ([rover.facing isEqualToString:@"S"] && rover.positionY < 331) {
        rover.positionY = rover.positionY + 50.0f;
    }
    else if ([rover.facing isEqualToString:@"W"] && rover.positionX > 0) {
        if (rover.positionX < 50) {
            rover.positionX = rover.positionX - 30.0f;
        } else {
            rover.positionX = rover.positionX - 50.0f;
        }
    }
    else if ([rover.facing isEqualToString:@"E"] && rover.positionX < 271) {
        if (rover.positionX == 250) {
            rover.positionX = rover.positionX + 30.0f;
        } else {
            rover.positionX = rover.positionX + 50.0f;
        }
    }
}

- (void)turnLeft:(RoverModel *)rover
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

- (void)turnRight:(RoverModel *)rover
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

- (void)changeSpeed:(NSString *)operation forRover:(RoverModel *)rover
{
    if ([operation isEqualToString:@"+"]) {
        rover.speed = rover.speed - 0.1f;
    } else if ([operation isEqualToString:@"-"]) {
        rover.speed = rover.speed + 0.1f;
    }
}
@end
