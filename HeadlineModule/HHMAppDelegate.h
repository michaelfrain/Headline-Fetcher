//
//  HHMAppDelegate.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/25/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHMRequestManager.h"
#import "HHMHeadlineArray.h"

@interface HHMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HHMHeadlineArray *headline;

@end
