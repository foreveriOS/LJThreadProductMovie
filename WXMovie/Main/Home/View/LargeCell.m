//
//  LargeCell.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "LargeCell.h"

@implementation LargeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(HomeModel *)model
{
    _model = model;
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:_model.images[@"large"]]];
}

@end
