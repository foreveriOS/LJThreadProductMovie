//
//  HomeCell.m
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super initWithCoder:coder];
//    if (self) {
//        
//    }
//    return self;
//}
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    return self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(HomeModel *)model
{
    _model = model;
    
    self.titleLabel.text = _model.title;
    if (iPhone6) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        self.yearLabel.font = [UIFont systemFontOfSize:18];
        self.ratingLabel.font = [UIFont systemFontOfSize:18];
    }
    self.titleLabel.textColor = [UIColor colorWithRed:122.0/255 green:59.0/255 blue:19.0/255 alpha:1];
    self.yearLabel.text = [NSString stringWithFormat:@"年份：%@",_model.year];
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",[_model.rating[@"average"] floatValue]];
    
    NSString *imageUrl = _model.images[@"medium"];
    //先通过图片链接下载成数据（data） 再对data进行转码成图片，显示到界面上
//    self.imgView.image = [UIImage imageNamed:@"pig"];
//    if ([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]]) {
//        self.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
//    }
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"pig"]];

    [_starView changeStarViewWidthWithRating:[self.ratingLabel.text floatValue]];
    
}

@end
