//
//  DetailViewController.m
//  Graphics
//
//  Created by jianing on 9/15/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.scoreLabel setText:[NSString stringWithFormat:@"%d", self.score]];
}

@end
