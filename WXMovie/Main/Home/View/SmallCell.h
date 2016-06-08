//
//  SmallCell.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

/*
 图片，cell的具体配置
 */

@interface SmallCell : UICollectionViewCell
{
    
    __weak IBOutlet UIImageView *imgView;
}

@property (nonatomic, strong) HomeModel *model;

@end
