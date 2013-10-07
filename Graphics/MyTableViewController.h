//
//  MyTableViewController.h
//  Graphics
//
//  Created by jianing on 9/16/13.
//  Copyright (c) 20/Users/twer/Developer/ios/Graphics/Graphics/DetailViewController.m13 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Players.h"

@interface MyTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) NSMutableArray *players;
@end
