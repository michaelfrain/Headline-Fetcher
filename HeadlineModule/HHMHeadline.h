//
//  HHMHeadline.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "JSONModel.h"

@class HHMLinks;

@interface HHMHeadline : JSONModel

@property (nonatomic, strong) NSString<Optional> *title;
@property (nonatomic, strong) NSString<Optional> *headline;
@property (nonatomic, strong) NSString<Optional> *description;
@property (nonatomic, strong) NSString<Optional> *source;
@property (nonatomic, strong) NSString<Optional> *byline;
@property (nonatomic, strong) NSString<Optional> *linkText;
@property (nonatomic, strong) HHMLinks<Optional> *links;

@end
