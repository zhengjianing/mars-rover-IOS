//
//  RoverModel.h
//  Graphics
//
//  Created by jianing on 9/8/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoverModel : NSObject

@property (nonatomic) NSInteger positionX;
@property (nonatomic) NSInteger positionY;
@property (nonatomic, strong) NSString *facing;
@property (nonatomic) CGFloat speed;
@property (nonatomic) CGFloat rotateDegree;

- (id)initAtPositionX:(CGFloat)positionX atPositionY:(CGFloat)positionY facing:(NSString *)orientation withSpeed:(CGFloat)speed andRotateDegree:rotateDegree;

@end
