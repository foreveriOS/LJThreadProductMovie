//
//  CinemaCell.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(CinemaModel *)model
{
    _model = model;
    
    cinemaNamelabel.text = _model.name;
    ratingLabel.text = _model.grade;
    addressLabel.text = _model.address;
    priceLabel.text = [NSString stringWithFormat:@"￥%@",_model.lowPrice];
    if ([_model.lowPrice isKindOfClass:[NSNull class]]) {
        priceLabel.text = @"";
    }
    distanceLabel.text = @"1km";
    
    if ([_model.isSeatSupport integerValue] == 1) {
        seatImgView.hidden = NO;
    } else {
        seatImgView.hidden = YES;
    }
    
    if ([_model.isCouponSupport integerValue] == 1) {
        couponImgView.hidden = NO;
    } else {
        couponImgView.hidden = YES;
    }
}

@end
