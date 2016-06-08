//
//  StarViewCode.m
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "StarViewCode.h"

@implementation StarViewCode

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//                self.height = kScreenWidth / 14;
                [self _createSubviews];
                self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.height = kScreenWidth / 14;
        [self _createSubviews];
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}
////表示从nib文件当中去加载时候会调用 nib NEXTSTEP interface bulider -> xcode
//- (void)awakeFromNib
//{
//    [super awakeFromNib];
////    self.height = kScreenWidth / 14;
////    [self _createSubviews];
////    self.backgroundColor = [UIColor clearColor];
//
//}

- (void)_createSubviews
{
    grayView = [[UIView alloc] init];
    yellowView = [[UIView alloc] init];
    [self addSubview:grayView];
    [self addSubview:yellowView];
    
    UIImage *image = [UIImage imageNamed:@"yellow"];
//    按比例缩放 对于缩放值添加0.5的原因在于，宽高之间存在误差 35 * 34 一个像素的误差，所以如果不添加，星星会少半只手 显示不完全
    float scale = self.height / (image.size.height + 0.5);

    
    grayView.transform = CGAffineTransformScale(grayView.transform,scale, scale);
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    grayView.frame = CGRectMake(0, 0, 5 * self.height, self.height);
    
    yellowView.backgroundColor = [UIColor colorWithPatternImage:image];
    grayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
//    yellowView.image = image;
//    grayView.image = [UIImage imageNamed:@"gray"];
}

- (void)changeStarViewWidthWithRating:(float)rating
{

    yellowView.frame = CGRectMake(0, 0, 5 * self.height * rating / 10, self.height);
}

@end
