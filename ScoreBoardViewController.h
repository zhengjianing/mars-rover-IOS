//
//  ScoreBoardViewController.h
//  Graphics
//
//  Created by jianing on 9/15/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreBoardViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) NSArray *scores;

@end
