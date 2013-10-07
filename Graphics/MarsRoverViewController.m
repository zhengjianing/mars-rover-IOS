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
#import "DetailViewController.h"

@interface MarsRoverViewController ()
@property (nonatomic) IBOutlet SkyView *graphicsViewControllerView;
@property (nonatomic) RoverView *roverView;
@property (nonatomic) Processor *processor;
@property (nonatomic) NSInteger score;
@end

CGFloat imageWidth;
CGFloat imageHight;

@implementation MarsRoverViewController

{
    Players *players;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.graphicsViewControllerView = [[SkyView alloc] init];
    UIImage *backgroundImage = [UIImage imageNamed:@"sky.jpg"];
    UIColor *skyBackground = [[UIColor alloc] initWithPatternImage:backgroundImage];
    self.graphicsViewControllerView.backgroundColor = skyBackground;
    [self.graphicsViewControllerView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 340.0f)];
    
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
    
    players = [[Players alloc] init];
    players.allPlayers = [[NSMutableArray alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if([segue.identifier isEqualToString:@"showDetail"]) {
        [segue.destinationViewController setScore:self.score];        
        [segue.destinationViewController setPlayers:players.allPlayers];
        self.score = 0;
    }
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
    self.score++;
    
    [UIView animateWithDuration:self.roverView.rover.speed
                          delay:0
                        options:nil
                     animations:^{
                         [self.roverView setFrame:CGRectMake(self.roverView.rover.positionX, self.roverView.rover.positionY, imageWidth, imageHight)];
                          }
                     completion:nil];
}

- (void)turnLeftByRotateImage
{
    [self.processor turnRight:self.roverView.rover];
   
    [UIView animateWithDuration:0.5f
                          delay:0
                        options:nil
                     animations:^{
                         self.roverView.transform = CGAffineTransformMakeRotation((self.roverView.rover.rotateDegree * M_PI)/180.0f);
                     }
                     completion:nil];
}

- (void)turnRightByRotateImage
{
    [self.processor turnLeft:self.roverView.rover];
    
    [UIView animateWithDuration:0.5f
                          delay:0
                        options:nil
                     animations:^{
                         self.roverView.transform = CGAffineTransformMakeRotation((self.roverView.rover.rotateDegree * M_PI)/180.0f);
                     }
                     completion:nil];
}

- (IBAction)restartButtonClicked:(id)sender {
    self.score = 0;
}

@end
