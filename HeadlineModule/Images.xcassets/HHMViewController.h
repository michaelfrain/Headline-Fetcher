//
//  HHMViewController.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHMHeadlineArray.h"
#import "HHMHeadline.h"

@interface HHMViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UISegmentedControl *headlineType;
@property (nonatomic, strong) IBOutlet UITableView *headlineTableView;

@property (nonatomic, strong) HHMHeadlineArray *headlineArray;

@end
