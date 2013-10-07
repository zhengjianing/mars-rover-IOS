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

{
    NSArray *sortedPlayers;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sortedPlayers = [self.players sortedArrayUsingComparator:^(id obj1, id obj2){
        NSNumber *score1 = [obj1 objectForKey:@"score"];
        NSNumber *score2 = [obj2 objectForKey:@"score"];
        return [score2 compare:score1];
    }];
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
    NSMutableArray *player = [sortedPlayers objectAtIndex:row];
    cell.textLabel.text = [player valueForKey:@"name"];
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    NSString *scoreString = [numberFormatter stringFromNumber:[player valueForKey:@"score"]];    
    cell.detailTextLabel.text = scoreString;
    return cell;
}

@end
