//
//  NewsImageCell.m
//  WXMovie
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "NewsImageCell.h"

@implementation NewsImageCell

- (void)awakeFromNib
{
//    [super awakeFromNib];
//    _imgView = [[UIImageView alloc] initWithFrame:self.frame];
//    NSLog(@"%@", NSStringFromCGRect(_imgView.frame));
//    [self addSubview:_imgView];
    _imgView.layer.cornerRadius = 10;
    _imgView.layer.masksToBounds = YES;
}

- (void)setModel:(ImageModel *)model
{
    _model = model;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
//    dataArray [addimgview.image ]
}

@end
