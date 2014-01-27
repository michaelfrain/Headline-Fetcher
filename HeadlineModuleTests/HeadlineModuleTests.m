//
//  HeadlineModuleTests.m
//  HeadlineModuleTests
//
//  Created by Michael Frain on 1/25/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HHMRequestManager.h"
#import "HHMViewController.h"
#import "HHMHeadlineArray.h"
#import "HHMHeadline.h"
#import "HHMLinks.h"
#import "HHMMobile.h"


@interface HeadlineModuleTests : XCTestCase

@property (nonatomic, strong) HHMHeadlineArray *testHeadlineArray;

@end

@implementation HeadlineModuleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModelBuilding {
    HHMRequestManager *requestManager = [HHMRequestManager sharedManager];
    [requestManager headlineOfType:@"sports" andSport:nil success:^(HHMHeadlineArray *headline) {
        self.testHeadlineArray = headline;
        NSLog(@"Test is Ready.");
        XCTAssertNotNil(self.testHeadlineArray, @"Data was not returned in the models properly.");
        HHMHeadline *testHeadline = [self.testHeadlineArray.headlines objectAtIndex:4];
        XCTAssertNotNil(testHeadline.links.mobile.href, @"Mobile Link model is not populating correctly.");
    } failure:^(NSError *error) {
        NSLog(@"Test is NOT Ready.");
    }];
}

@end
