//
//  TopCollectionViewCell.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"
#import "StarViewCode.h"

#define kItemCount  3       //每行item的个数
#define kItemWidth  100     //item的宽度
#define kItemHeight 166     //item的高度

@interface TopCollectionViewCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *scoreLabel;
    
    StarViewCode *starView;
}

@property(nonatomic, strong)TopModel *model;

@end
