//
//  HHMViewController.m
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "HHMViewController.h"
#import "HHMRequestManager.h"
#import "HHMHeadlineCell.h"
#import "HHMWebViewController.h"
#import "HHMMobile.h"
#import "HHMLinks.h"

@interface HHMViewController ()

@end

@implementation HHMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headlineArray = [[HHMHeadlineArray alloc] init];
    HHMRequestManager *manager = [HHMRequestManager sharedManager];
    [manager headlineOfType:@"sports" andSport:nil success:^(HHMHeadlineArray *headline) {
        self.headlineArray = [[HHMHeadlineArray alloc] init];
        self.headlineArray = headline;
        NSLog(@"Fetching Headline lists.");
        [self.headlineTableView reloadData];
    }failure:^(NSError *error) {
        NSLog(@"Could not fetch Headline lists.");
    }];
    
    [self.headlineType addTarget:self action:@selector(headlineTypeChanged:) forControlEvents:UIControlEventValueChanged];

}

#pragma mark - UITableViewDataSource and UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headlineArray.headlines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    HHMHeadline *headlineObject = [self.headlineArray.headlines objectAtIndex:indexPath.row];
    
    HHMHeadlineCell *headlineCell;
    if (!headlineObject.headline) {
        headlineCell = [HHMHeadlineCell cellForTableView:tableView withHeadlineText:@"(Headline unavailable)"];
    } else {
        headlineCell = [HHMHeadlineCell cellForTableView:tableView withHeadlineText:headlineObject.headline];
    }
    
    cell = headlineCell;
    
    if (!headlineCell) {
        cell = [[UITableViewCell alloc] init];
    }
    return cell;
}

#pragma mark - Segmented Control change Methods

- (void)headlineTypeChanged:(id)sender {
    HHMRequestManager *manager = [HHMRequestManager sharedManager];
    switch (self.headlineType.selectedSegmentIndex) {
        case 0: {
            [manager headlineOfType:@"sports" andSport:nil success:^(HHMHeadlineArray *headline) {
                self.headlineArray = headline;
                NSLog(@"Fetching new Headline lists for General type.");
                [self.headlineTableView reloadData];
            }failure:^(NSError *error) {
                NSLog(@"Problem fetching General headline lists.");
            }];
        }
            break;
            
        case 1: {
            [manager headlineOfType:@"sports" andSport:@"football" success:^(HHMHeadlineArray *headline) {
                self.headlineArray = headline;
                NSLog(@"Fetching new Football Headlines.");
                [self.headlineTableView reloadData];
            }failure:^(NSError *error) {
                NSLog(@"Problem fetching Football headline lists.");
            }];
        }
            break;
            
        case 2: {
            [manager headlineOfType:@"sports" andSport:@"baseball" success:^(HHMHeadlineArray *headline) {
                self.headlineArray = headline;
                NSLog(@"Fetching new Baseball headlines.");
                [self.headlineTableView reloadData];
            }failure:^(NSError *error) {
                NSLog(@"Problem fetching Baseball headline lists.");
            }];
        }
            break;
            
        case 3: {
            [manager headlineOfType:@"sports" andSport:@"basketball" success:^(HHMHeadlineArray *headline) {
                self.headlineArray = headline;
                NSLog(@"Fetching new Basketball headlines.");
                [self.headlineTableView reloadData];
            }failure:^(NSError *error) {
                NSLog(@"Problem fetching Basketball headline lists.");
            }];
        }
            break;
            
        default: {
            NSLog(@"This segment index should not exist.");
        }
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *identifier = [segue identifier];
    
    if ([identifier isEqualToString:@"HHMWebModal"]) {
        UINavigationController *navController = [segue destinationViewController];
        HHMWebViewController *webController = (HHMWebViewController *)[navController topViewController];
        NSInteger cellIndex = [self.headlineTableView indexPathForCell:sender].row;
        HHMHeadline *headline = [self.headlineArray.headlines objectAtIndex:cellIndex];
        webController.urlForWebView = [NSURL URLWithString:headline.links.mobile.href];
    }
}

@end
