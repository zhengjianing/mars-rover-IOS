//
//  GraphicsViewController.m
//  Graphics
//
//  Created by jianing on 9/7/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "GraphicsViewController.h"
#import "GraphicsViewControllerView.h"

@interface GraphicsViewController ()
@property (nonatomic) IBOutlet GraphicsViewControllerView *graphicsViewControllerView;
@end

CGFloat degree = 0.0f;

@implementation GraphicsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImage *roverImage = [UIImage imageNamed:@"roverNorth.jpg"];
    self.graphicsViewControllerView = [[GraphicsViewControllerView alloc] initWithImage:roverImage atPositionX:0.0f atPositionY:0.0f facing:@"N"];

    CGSize myImageSize = self.graphicsViewControllerView.roverImage.size;
    [self.graphicsViewControllerView setFrame:CGRectMake(self.graphicsViewControllerView.positionX, self.graphicsViewControllerView.positionY, myImageSize.width, myImageSize.height)];
 
    [self.view addSubview:self.graphicsViewControllerView];
}

- (IBAction)operationButtonPressed:(UIButton *)sender {
    NSString *operation = sender.currentTitle;
    
    if ([operation isEqualToString:@"M"]) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"rover animation" context:context];
        [UIView setAnimationDuration:1.0f];
        [UIView setAnimationDelegate:self];

        if ([self.graphicsViewControllerView.facing isEqualToString:@"N"] && self.graphicsViewControllerView.positionY > 0) {
            self.graphicsViewControllerView.positionY = self.graphicsViewControllerView.positionY - 30.0f;
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"S"] && self.graphicsViewControllerView.positionY < 331) {
            self.graphicsViewControllerView.positionY = self.graphicsViewControllerView.positionY + 30.0f;
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"W"] && self.graphicsViewControllerView.positionX > 0) {
            self.graphicsViewControllerView.positionX = self.graphicsViewControllerView.positionX - 30.0f;
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"E"] && self.graphicsViewControllerView.positionX < 271) {
            if (self.graphicsViewControllerView.positionX == 240) {
                self.graphicsViewControllerView.positionX = self.graphicsViewControllerView.positionX + 20.0f;
            } else {
            self.graphicsViewControllerView.positionX = self.graphicsViewControllerView.positionX + 30.0f;
            }
        }
        
        CGSize myImageSize = self.graphicsViewControllerView.roverImage.size;
        [self.graphicsViewControllerView setFrame:CGRectMake(self.graphicsViewControllerView.positionX, self.graphicsViewControllerView.positionY, myImageSize.width, myImageSize.height)];
        [UIView commitAnimations];
    }
   
    else if ([operation isEqualToString:@"R"]) {
        degree = degree + 90.0f;
        self.graphicsViewControllerView.transform = CGAffineTransformMakeRotation((degree * M_PI)/180.0f);
        
        if ([self.graphicsViewControllerView.facing isEqualToString:@"N"]) {
            self.graphicsViewControllerView.facing = @"E";
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"E"]) {
            self.graphicsViewControllerView.facing = @"S";
        } 
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"S"]) {
            self.graphicsViewControllerView.facing = @"W";
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"W"]) {
            self.graphicsViewControllerView.facing = @"N";
        }
    }
        
    else if ([operation isEqualToString:@"L"]) {
        degree = degree - 90.0f;
        self.graphicsViewControllerView.transform = CGAffineTransformMakeRotation((degree * M_PI)/180.0f);
        
        if ([self.graphicsViewControllerView.facing isEqualToString:@"N"]) {
            self.graphicsViewControllerView.facing = @"W";
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"W"]) {
            self.graphicsViewControllerView.facing = @"S";
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"S"]) {
            self.graphicsViewControllerView.facing = @"E";
        }
        else if ([self.graphicsViewControllerView.facing isEqualToString:@"E"]) {
            self.graphicsViewControllerView.facing = @"N";
        }
    }
}
@end
