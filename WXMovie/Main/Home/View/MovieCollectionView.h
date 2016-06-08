//
//  MovieCollectionView.h
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MovieKVOValue @"currentIndex"

/*
 1、加载model数据，创建对象，基础的样式配置，cell的长宽比
 2、
 */

@interface MovieCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, assign) CGFloat itemWidth;

@end
