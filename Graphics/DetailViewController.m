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

- (IBAction)detailViewTouchDown:(id)sender
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (IBAction)inputName:(UITextField *)sender {
    self.name = sender.text;
    
    NSMutableDictionary *player=[[NSMutableDictionary alloc] init];
    [player setObject:self.name forKey:@"name"];
    [player setObject:[NSNumber numberWithInteger:self.score] forKey:@"score"];
    [self.players addObject:player];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"goToScoreboard"]) {
        [segue.destinationViewController setPlayers:self.players];
    }
}



// remove
- (IBAction)nameInputed:(UITextField *)sender {
}

// remove
- (IBAction)goToScoreboardPressed:(UIButton *)sender {
}

@end
