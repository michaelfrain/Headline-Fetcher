//
//  HHMRequestManager.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
#import "HHMHeadlineArray.h"

typedef void (^HeadlineSuccessBlock)(HHMHeadlineArray *headline);
typedef void (^HeadlineErrorBlock)(NSError *error);

@interface HHMRequestManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)headlineOfType:(NSString *)type andSport:(NSString *)sport success:(HeadlineSuccessBlock)success failure:(HeadlineErrorBlock)failure;

@end
