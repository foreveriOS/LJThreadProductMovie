//
//  CinemaCell.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *seatImgView;
    __weak IBOutlet UIImageView *couponImgView;
    __weak IBOutlet UILabel *distanceLabel;
    __weak IBOutlet UILabel *priceLabel;
    __weak IBOutlet UILabel *addressLabel;
    __weak IBOutlet UILabel *ratingLabel;
    __weak IBOutlet UILabel *cinemaNamelabel;
}

@property(nonatomic, strong)CinemaModel *model;

@end
