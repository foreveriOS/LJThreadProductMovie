//
//  PostView.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LargeCollectionView.h"
#import "SmallCollectionView.h"

#define kHeaderHeight 130
#define kFooterHeight 30
#define kMovieSmallViewHeight 100

/*
 1、需要上面headerView，中间largeView，下面titleLabel，灯视图
 2、就是呈现基本的视图
 */
@interface PostView : UIView
{
    UIImageView *headView;
    UILabel *titleLabel;
    UIControl *maskView;

    MovieCollectionView *largeView;
    MovieCollectionView *smallView;
}

@property (nonatomic, strong) NSArray *dataArray;


@end
