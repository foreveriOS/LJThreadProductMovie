//
//  HomeCell.h
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "StarViewCode.h"

@interface HomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet StarViewCode *starView;

//每个cell对应一个model的数据，所有cell的值都是来源于model
@property (nonatomic, strong) HomeModel *model;

@end
