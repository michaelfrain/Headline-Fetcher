//
//  HHMHeadlineArray.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "JSONModel.h"

@protocol HHMHeadline;

@interface HHMHeadlineArray : JSONModel

@property (nonatomic, strong) NSArray<HHMHeadline> *headlines;

@end
