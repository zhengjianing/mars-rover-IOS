//
//  GraphicsViewController.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "GraphicsViewController.h"
#import "GraphicsViewControllerView.h"
#import "RoverView.h"

@interface GraphicsViewController ()
@property (nonatomic) IBOutlet GraphicsViewControllerView *graphicsViewControllerView;
@property (nonatomic) IBOutlet  RoverView *roverView;
@end

CGFloat degree = 0.0f;
CGFloat speed = 0.5f;
UIImage *roverImage;

@implementation GraphicsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImage *backgroundImage = [UIImage imageNamed:@"sky3.jpg"];
    UIColor *skyBackground = [[UIColor alloc] initWithPatternImage:backgroundImage];
    self.graphicsViewControllerView = [[GraphicsViewControllerView alloc] init];
    self.graphicsViewControllerView.backgroundColor = skyBackground;
    [self.graphicsViewControllerView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 390.0f)];
    [self.view addSubview:self.graphicsViewControllerView];
    
    
    roverImage = [UIImage imageNamed:@"rovergreen222.png"];
    UIColor *roverBackground = [[UIColor alloc] initWithPatternImage:roverImage];
    self.roverView = [[RoverView alloc] initAtPositionX:0.0f atPositionY:0.0f facing:@"N"];
    self.roverView.backgroundColor = roverBackground;
    [self.roverView setFrame:CGRectMake(self.roverView.positionX, self.roverView.positionY, roverImage.size.width, roverImage.size.height)];
    [self.view addSubview:self.roverView];
}

- (IBAction)operationButtonPressed:(UIButton *)sender {
    NSString *operation = sender.currentTitle;
    
    if ([operation isEqualToString:@"M"]) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"rover animation" context:context];
        [UIView setAnimationDuration:speed];
        [UIView setAnimationDelegate:self];

        if ([self.roverView.facing isEqualToString:@"N"] && self.roverView.positionY > 0) {
            self.roverView.positionY = self.roverView.positionY - 50.0f;
        }
        else if ([self.roverView.facing isEqualToString:@"S"] && self.roverView.positionY < 331) {
            self.roverView.positionY = self.roverView.positionY + 50.0f;
        }
        else if ([self.roverView.facing isEqualToString:@"W"] && self.roverView.positionX > 0) {
            if (self.roverView.positionX < 50) {
                self.roverView.positionX = self.roverView.positionX - 30.0f;
            } else {
                self.roverView.positionX = self.roverView.positionX - 50.0f;
            }
        }
        else if ([self.roverView.facing isEqualToString:@"E"] && self.roverView.positionX < 271) {
            if (self.roverView.positionX == 250) {
                self.roverView.positionX = self.roverView.positionX + 30.0f;
            } else {
            self.roverView.positionX = self.roverView.positionX + 50.0f;
            }
        }
        
        [self.roverView setFrame:CGRectMake(self.roverView.positionX, self.roverView.positionY, roverImage.size.width, roverImage.size.height)];
        [UIView commitAnimations];
    }
   
    else if ([operation isEqualToString:@"R"]) {
        degree = degree + 90.0f;
        self.roverView.transform = CGAffineTransformMakeRotation((degree * M_PI)/180.0f);
        
        if ([self.roverView.facing isEqualToString:@"N"]) {
            self.roverView.facing = @"E";
        }
        else if ([self.roverView.facing isEqualToString:@"E"]) {
            self.roverView.facing = @"S";
        } 
        else if ([self.roverView.facing isEqualToString:@"S"]) {
            self.roverView.facing = @"W";
        }
        else if ([self.roverView.facing isEqualToString:@"W"]) {
            self.roverView.facing = @"N";
        }
    }
        
    else if ([operation isEqualToString:@"L"]) {
        degree = degree - 90.0f;
        self.roverView.transform = CGAffineTransformMakeRotation((degree * M_PI)/180.0f);
        
        if ([self.roverView.facing isEqualToString:@"N"]) {
            self.roverView.facing = @"W";
        }
        else if ([self.roverView.facing isEqualToString:@"W"]) {
            self.roverView.facing = @"S";
        }
        else if ([self.roverView.facing isEqualToString:@"S"]) {
            self.roverView.facing = @"E";
        }
        else if ([self.roverView.facing isEqualToString:@"E"]) {
            self.roverView.facing = @"N";
        }
    }
}

- (IBAction)speedButtonPressed:(UIButton *)sender {
    NSString *op = sender.currentTitle;
    if ([op isEqualToString:@"+"]) {
        speed = speed - 0.1f;
    } else {
        speed = speed + 0.1f;
    }
}


@end
