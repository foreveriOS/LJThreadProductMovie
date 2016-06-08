//
//  WXTabBarButton.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "WXTabBarButton.h"

#define kItemSize 20

@implementation WXTabBarButton

- (instancetype)initWithFrame:(CGRect)frame withImgName:(NSString *)imgName withTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - kItemSize) / 2, 5, kItemSize, kItemSize)];
        imageView.image = [UIImage imageNamed:imgName];
//        UIViewContentModeScaleAspectFit 按比例缩放 UIViewContentModeScaleAspectFill 填充
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
//        获取一个控件底部的y值 CGRectGetMaxY
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 5, frame.size.width, 15)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = title;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:titleLabel];
        
    }
    
    return self;
}

- (void)imageForSelected:(NSString *)imageName
{
//    self.selected = YES;
    
    imageView.image = [UIImage imageNamed:imageName];

}


@end
