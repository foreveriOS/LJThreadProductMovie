//
//  StarViewCode.h
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarViewCode : UIView
{
    UIView *yellowView;
    UIView *grayView;
}

- (void)changeStarViewWidthWithRating:(float )rating;

@end
