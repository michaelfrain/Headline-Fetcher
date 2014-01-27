//
//  HHMRequestManager.m
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "HHMRequestManager.h"

#define ESPN_BASE_URL @"http://api.espn.com"

@implementation HHMRequestManager

+ (instancetype)sharedManager {
    static HHMRequestManager *sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *baseURLString = [NSString stringWithFormat:@"%@/v1", ESPN_BASE_URL];
        NSURL *espnBaseURL = [NSURL URLWithString:baseURLString];
        
        sharedManager = [[HHMRequestManager alloc] initWithBaseURL:espnBaseURL];
    });
    
    return sharedManager;
}

- (void)headlineOfType:(NSString *)type andSport:(NSString *)sport success:(HeadlineSuccessBlock)success failure:(HeadlineErrorBlock)failure {
    NSDictionary *requestParameters = @{@"apikey":@"appsgcvm2xw6wn3bp4pfrxs3"};
    
    NSString *getURL;
    if (sport != nil) {
        getURL = [NSString stringWithFormat:@"%@%@/%@/news", self.baseURL.absoluteString, type, sport];
    } else {
        getURL = [NSString stringWithFormat:@"%@%@/news", self.baseURL.absoluteString, type];
    }
    [self GET:getURL parameters:requestParameters success:^(NSURLSessionDataTask *dataTask, id responseObject) {
        NSLog(@"Building headline list!");
        NSError *error = nil;
        HHMHeadlineArray *headline = [[HHMHeadlineArray alloc] initWithDictionary:responseObject error:&error];
        success(headline);
        NSLog(@"Headline list is now available.");
    }failure:^(NSURLSessionDataTask *dataTask, NSError *error) {
        failure(error);
        NSLog(@"Didn't work!");
    }];
}



@end
