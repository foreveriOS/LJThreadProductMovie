//
//  PostView.m
//  WXMovie
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "PostView.h"
#import "HomeModel.h"

@implementation PostView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _createUI];
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    largeView.dataArray = _dataArray;
    smallView.dataArray = _dataArray;
    
    [self changeTitleWithIndex:0];
}

- (void)_createUI
{
    self.backgroundColor = [UIColor clearColor];
    //创建大海报视图
    [self _createLargeView];
    //创建头部视图
    [self _createHeaderView];
    //创建底部视图
    [self _createFooterView];
    //创建灯光效果
    [self _createLightView];
    
    [self _createMaskView];
    
    [self _createGesture];
//    改变视图层次结构
    [self bringSubviewToFront:headView];
//    self.subviews indexOfObject:headView
    //大小collectionView互相观察
    [largeView addObserver:smallView forKeyPath:MovieKVOValue options:NSKeyValueObservingOptionNew  context:nil];
    
    [smallView addObserver:largeView forKeyPath:MovieKVOValue options:NSKeyValueObservingOptionNew context:nil];
    
    //设置title的观察
    [largeView addObserver:self forKeyPath:MovieKVOValue options:NSKeyValueObservingOptionNew context:nil];
}

- (void)_createLargeView
{
    MovieLayout *layout = [[LargeLayout alloc] init];
    largeView = [[LargeCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49 - kFooterHeight) collectionViewLayout:layout];

    [self addSubview:largeView];
}

- (void)_createHeaderView
{
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    headView = [[UIImageView alloc] initWithImage:image];
    
    //是否相应点击时间
    headView.userInteractionEnabled = YES;
    
    headView.frame = CGRectMake(0, - kMovieSmallViewHeight - 5, kScreenWidth, kHeaderHeight);
    
    [self addSubview:headView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((kScreenWidth - 26) / 2, kHeaderHeight - 20, 26, 20);
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    button.tag = 100;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [headView addSubview:button];
    
    MovieLayout *layout = [[SmallLayout alloc] init];
    smallView = [[SmallCollectionView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, kMovieSmallViewHeight) collectionViewLayout:layout];
    [headView addSubview:smallView];
}
- (void)_createFooterView
{
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight - 64 - 49 - kFooterHeight, kScreenWidth, kFooterHeight)];
   
    titleLabel.textAlignment = NSTextAlignmentCenter;
//    HomeModel *model = self.dataArray[0];
//    titleLabel.text = model.title;
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    [self addSubview:titleLabel];
    
}
- (void)_createLightView
{
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 124, 204)];
    left.image = [UIImage imageNamed:@"light"];
    
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 10 - 124, 5, 124, 204)];
    right.image = [UIImage imageNamed:@"light"];
    
    [self addSubview:left];
    [self addSubview:right];
}

- (void)_createMaskView
{
    maskView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49)];
    
    [maskView addTarget:self action:@selector(maskAction) forControlEvents:UIControlEventTouchUpInside];
    maskView.backgroundColor = [UIColor blackColor];
    
    maskView.alpha = 0;
    
    [self insertSubview:maskView belowSubview:headView];
}

- (void)_createGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(maskAction)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipe];
}

- (void)buttonAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    //界面动画
    [UIView animateWithDuration:0.25 animations:^{
        headView.top = sender.selected ? 0 : (-kMovieSmallViewHeight - 5);
        maskView.alpha = sender.selected ? 0.6 : 0;
    }];
}

- (void)maskAction
{
    UIButton *button = (UIButton *)[headView viewWithTag:100];
    [self buttonAction:button];
}

#pragma - mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
//    titleLabel.text = model = _dataArray[index]
    NSInteger index = [change[@"new"] integerValue];
    [self changeTitleWithIndex:index];
}

- (void)changeTitleWithIndex:(NSInteger )index
{
    HomeModel *model = _dataArray[index];
    titleLabel.text = model.title;
}


@end
