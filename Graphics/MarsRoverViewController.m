//
//  MarsRoverViewController.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "MarsRoverViewController.h"
#import "SkyView.h"
#import "RoverView.h"
#import "Processor.h"

@interface MarsRoverViewController ()
@property (nonatomic) IBOutlet SkyView *graphicsViewControllerView;
@property (nonatomic) RoverView *roverView;
@property (nonatomic) Processor *processor;
@end

CGFloat imageWidth;
CGFloat imageHight;

@implementation MarsRoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.graphicsViewControllerView = [[SkyView alloc] init];
    UIImage *backgroundImage = [UIImage imageNamed:@"sky.jpg"];
    UIColor *skyBackground = [[UIColor alloc] initWithPatternImage:backgroundImage];
    self.graphicsViewControllerView.backgroundColor = skyBackground;
    [self.graphicsViewControllerView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 390.0f)];
    
    UIImage *roverImage = [UIImage imageNamed:@"rover.png"];
    imageWidth = roverImage.size.width;
    imageHight = roverImage.size.height;
    UIColor *roverBackground = [[UIColor alloc] initWithPatternImage:roverImage];

    Rover *rover = [[Rover alloc] initAtPositionX:100.0f atPositionY:150.0f facing:@"N" withSpeed:1.0f andRotateDegree:0.0f];
    self.roverView = [[RoverView alloc] initWithRover:rover];
    self.roverView.backgroundColor = roverBackground;
    [self.roverView setFrame:CGRectMake(self.roverView.rover.positionX, self.roverView.rover.positionY, imageWidth, imageHight)];
    
    [self.view addSubview:self.graphicsViewControllerView];
    [self.view addSubview:self.roverView];

    self.processor = [[Processor alloc] init];
}

- (IBAction)operationButtonPressed:(UIButton *)sender {
    NSString *operation = sender.currentTitle;
    
    if ([operation isEqualToString:@"M"]) {
        [self moveRoverWithAnimation];
    }
    else if ([operation isEqualToString:@"R"]) {
        [self turnRightByRotateImage];
    }
    else if ([operation isEqualToString:@"L"]) {
        [self turnLeftByRotateImage];
    }
}

- (IBAction)speedButtonPressed:(UIButton *)sender {
    [self.processor changeSpeed:sender.currentTitle forRover:self.roverView.rover];
}

- (void)moveRoverWithAnimation
{
    [self.processor moveForward:self.roverView.rover];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIImageView beginAnimations:@"rover animation" context:context];
    [UIImageView setAnimationDuration:self.roverView.rover.speed];
    [UIImageView setAnimationDelegate:self];
    [self.roverView setFrame:CGRectMake(self.roverView.rover.positionX, self.roverView.rover.positionY, imageWidth, imageHight)];
    [UIImageView commitAnimations];
}

- (void)turnLeftByRotateImage
{
    [self.processor turnRight:self.roverView.rover];
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIImageView beginAnimations:@"rover animation" context:context];
    [UIImageView setAnimationDuration:0.5f];
    [UIImageView setAnimationDelegate:self];
    self.roverView.transform = CGAffineTransformMakeRotation((self.roverView.rover.rotateDegree * M_PI)/180.0f);
    [UIImageView commitAnimations];
}

- (void)turnRightByRotateImage
{
    [self.processor turnLeft:self.roverView.rover];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIImageView beginAnimations:@"rover animation" context:context];
    [UIImageView setAnimationDuration:0.5f];
    [UIImageView setAnimationDelegate:self];
    self.roverView.transform = CGAffineTransformMakeRotation((self.roverView.rover.rotateDegree * M_PI)/180.0f);
    [UIImageView commitAnimations];
}

@end
