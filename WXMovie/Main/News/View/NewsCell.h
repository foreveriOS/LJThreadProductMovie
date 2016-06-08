//
//  NewsCell.h
//  WXMovie
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewsModel.h"

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@property (nonatomic, strong) NewsModel *model;
@end
