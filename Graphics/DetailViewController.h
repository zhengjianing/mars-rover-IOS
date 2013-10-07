//
//  DetailViewController.h
//  Graphics
//
//  Created by jianing on 9/15/13.
//  Copyright (c) 2013 jianing. All rights reserved.
///Users/twer/Developer/ios/Graphics/Graphics/DetailViewController.m

#import <UIKit/UIKit.h>
#import "Players.h"
#import "MyTableViewController.h"

@interface DetailViewController : UIViewController

@property (nonatomic) NSInteger score;
@property (nonatomic) NSString *name;
@property (nonatomic) NSMutableArray *players;
- (IBAction)detailViewTouchDown:(id)sender;

@end
