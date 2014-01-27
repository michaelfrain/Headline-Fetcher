//
//  HHMHeadlineCell.m
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import "HHMHeadlineCell.h"

@implementation HHMHeadlineCell

+ (instancetype)cellForTableView:(UITableView *)tableView withHeadlineText:(NSString *)headline {
    HHMHeadlineCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    
    cell.headlineText = headline;
    
    return cell;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addObserver:self forKeyPath:@"headlineText" options:NSKeyValueObservingOptionInitial context:NULL];
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"headlineText"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"headlineText"]) {
        self.lblHeadline.text = self.headlineText;
    }
}

@end
