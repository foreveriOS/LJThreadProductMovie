//
//  WXTabBarButton.h
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarButton : UIControl
{
    UIImageView *imageView;
    UILabel *titleLabel;
//    高亮背景 选中的背景
}

- (instancetype)initWithFrame:(CGRect)frame
                  withImgName:(NSString *) imgName
                    withTitle:(NSString *)title;

- (void)imageForSelected:(NSString *)imageName;
@end
