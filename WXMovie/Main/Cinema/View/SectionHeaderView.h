//
//  SectionHeaderView.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSectionHeaderHeight 35

@interface SectionHeaderView : UITableViewHeaderFooterView

@property(nonatomic, weak, readonly)UIControl *ctrlView;
@property(nonatomic, weak, readonly)UILabel *titleLabel;

@end
