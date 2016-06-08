//
//  NewsCell.m
//  WXMovie
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(NewsModel *)model
{
    _model = model;
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:_model.image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _titleLabel.text = _model.title;
    _summaryLabel.text = _model.summary;
    
    NSString *imgName;
    switch (_model.newsType) {
        case WordType:
            imgName = nil;
            break;
        case ImageType:
            imgName = @"sctpxw";
            break;
        case VideoType:
            imgName = @"scspxw";
            break;
        default:
            break;
    }

    _typeImageView.image = [UIImage imageNamed:imgName];
}

@end
