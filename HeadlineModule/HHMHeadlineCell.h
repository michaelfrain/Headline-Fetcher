//
//  HHMHeadlineCell.h
//  HeadlineModule
//
//  Created by Michael Frain on 1/26/14.
//  Copyright (c) 2014 MFrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHMHeadlineCell : UITableViewCell

@property (nonatomic, strong) NSString *headlineText;

@property (nonatomic, strong) IBOutlet UILabel *lblHeadline;

+ (instancetype)cellForTableView:(UITableView *)tableView withHeadlineText:(NSString *)headline;

@end
