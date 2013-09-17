//
//  DetailViewController.h
//  Graphics
//
//  Created by jianing on 9/15/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic) NSInteger score;
@property (nonatomic) NSString *name;
- (IBAction)detailViewTouchDown:(id)sender;

@end
