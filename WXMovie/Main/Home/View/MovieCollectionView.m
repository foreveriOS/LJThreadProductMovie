//
//  MovieCollectionView.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "MovieCollectionView.h"

@implementation MovieCollectionView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
//        设置滑动的速度
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    
    return self;
}
//生成item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    
//    if ([self respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:)]) {
//        [self performSelector:@selector(aaa:)];
//    }
    
//    if ([UIApplication sharedApplication] canOpenURL:<#(nonnull NSURL *)#>) {
//        [UIApplication sharedApplication] openURL:<#(nonnull NSURL *)#>
//    }
    
    return _dataArray.count;
}
//生成cell实例
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //利用注册的单元格进行创建
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:<#(nonnull NSString *)#> forIndexPath:<#(nonnull NSIndexPath *)#>]
    
    
    
    return nil;
}

//设置item的edgeinsets 就是微调目的位置和实际位置之间的偏差
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth) / 2, 0, (kScreenWidth - _itemWidth) / 2);
}

//设置item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_itemWidth, self.height);
}

//inout 关键字表示该形参在当前方法或者函数当中修改，在外部的实参也能够被修改 对实参可读可写
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    //获取内容偏移量
    CGFloat offsetX = targetContentOffset -> x;
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    
    NSInteger pageWidth = _itemWidth + layout.minimumLineSpacing;
    
    //计算页数
    NSInteger pageNum = (offsetX + pageWidth / 2) / pageWidth;
    
    //细节的处理 加速效果下出现偏移的情况配置
    pageNum = velocity.x == 0 ? pageNum : (velocity.x > 0 ? pageNum + 1 : pageNum - 1);
    
    pageNum = MIN(MAX(pageNum, 0), self.dataArray.count - 1);
    
    targetContentOffset -> x = pageNum * pageWidth;
    
//    [self scrollToItemAtIndexPath:<#(nonnull NSIndexPath *)#> atScrollPosition:<#(UICollectionViewScrollPosition)#> animated:<#(BOOL)#>]
    
    self.currentIndex = pageNum;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentIndex != indexPath.row) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.row;
    }
}

#pragma - mark KVO 观察到currentIndex的改变的时候调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{

    
    //KVO的触发方式 1、setter 方法 2、kvc 3、willchange didchange
    NSInteger index = [change[@"new"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = index;
    }
}

@end
