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
#import "ProcessorModel.h"

@interface GraphicsViewController ()
@property (nonatomic) IBOutlet GraphicsViewControllerView *graphicsViewControllerView;
@property (nonatomic) RoverView *roverView;
@property (nonatomic) ProcessorModel *processor;
@end

CGFloat imageWidth;
CGFloat imageHight;

@implementation GraphicsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.graphicsViewControllerView = [[GraphicsViewControllerView alloc] init];
    UIImage *backgroundImage = [UIImage imageNamed:@"sky.jpg"];
    UIColor *skyBackground = [[UIColor alloc] initWithPatternImage:backgroundImage];
    self.graphicsViewControllerView.backgroundColor = skyBackground;
    [self.graphicsViewControllerView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 390.0f)];
    
    UIImage *roverImage = [UIImage imageNamed:@"rover.png"];
    imageWidth = roverImage.size.width;
    imageHight = roverImage.size.height;

    self.roverView = [[RoverView alloc] init];
    UIColor *roverBackground = [[UIColor alloc] initWithPatternImage:roverImage];
    self.roverView.backgroundColor = roverBackground;
    [self.roverView setFrame:CGRectMake(self.roverView.rover.positionX, self.roverView.rover.positionY, imageWidth, imageHight)];
    
    [self.view addSubview:self.graphicsViewControllerView];
    [self.view addSubview:self.roverView];

    self.processor = [[ProcessorModel alloc] init];
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
    self.roverView.transform = CGAffineTransformMakeRotation((self.roverView.rover.rotateDegree * M_PI)/180.0f);
}

- (void)turnRightByRotateImage
{
    [self.processor turnLeft:self.roverView.rover];
    self.roverView.transform = CGAffineTransformMakeRotation((self.roverView.rover.rotateDegree * M_PI)/180.0f);
}

@end
