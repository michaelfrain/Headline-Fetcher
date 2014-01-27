//
//  HHMWebViewController.m
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "HHMWebViewController.h"

@interface HHMWebViewController ()

@end

@implementation HHMWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.urlForWebView];
    [self.mainWebView loadRequest:urlRequest];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismissing web view.");
    }];
}

@end
