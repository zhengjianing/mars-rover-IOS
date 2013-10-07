//
//  MyTableViewController.m
//  Graphics
//
//  Created by jianing on 9/16/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ScoreboardIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSMutableArray *player = [self.players objectAtIndex:row];
    cell.textLabel.text = [player valueForKey:@"name"];
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    NSString *scoreString = [numberFormatter stringFromNumber:[player valueForKey:@"score"]];    
    cell.detailTextLabel.text = scoreString;
    return cell;
}

@end
