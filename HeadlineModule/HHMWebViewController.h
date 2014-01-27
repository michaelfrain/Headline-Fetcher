//
//  HHMWebViewController.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHMWebViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *mainWebView;
@property (nonatomic, strong) NSURL *urlForWebView;

- (IBAction)doneButtonPressed:(id)sender;

@end
