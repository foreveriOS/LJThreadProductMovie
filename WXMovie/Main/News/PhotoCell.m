//
//  PhotoCell.m
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "PhotoCell.h"
#import "UIView+ViewController.h"

@implementation PhotoCell
{
    UIImageView *imageView;
    UIAlertController *alertCtrl;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self _createImageView];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self _createImageView];
}

- (void)setImgUrlStr:(NSString *)imgUrlStr
{
    _imgUrlStr = imgUrlStr;
    
   [imageView sd_setImageWithURL:[NSURL URLWithString:_imgUrlStr]];
    
}

- (void)_createImageView
{
    imageView = [[UIImageView alloc] initWithFrame:self.bounds];

    imageView.contentMode = UIViewContentModeScaleAspectFit;
   //一定要打开这个，否则imgView无法接受触摸事件
    imageView.userInteractionEnabled = YES;
    //添加长按手势
    [imageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(savePhoto:)]];
    
    [self.contentView addSubview:imageView];
}

- (void)savePhoto:(UIGestureRecognizer *)longPress
{
    alertCtrl = [UIAlertController alertControllerWithTitle:@"是否保存图片？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertCtrl addAction:[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //判断状态 -》 拿到图片 -》 找到相册 -》 保存到相册
//        if (longPress.state == UIGestureRecognizerStateBegan) {
            UIImage *img = imageView.image;
            //保存图片到相册当中的方法
            if (img) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
                
                hud.labelText = @"Saving";
                hud.dimBackground = YES;
                
                //hud 因为是OC当中的指针和C语言指针进行配置过程当中需要桥接
                UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void * _Nullable)(hud));
            }
    }]];
    
    [alertCtrl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
    
    [self.viewController presentViewController:alertCtrl animated:YES completion:NULL];

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    MBProgressHUD *hud = (__bridge MBProgressHUD *)(contextInfo);
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"Success!";
    
    [hud hide:YES afterDelay:1.5];
    NSLog(@"保存成功！");
    [alertCtrl dismissViewControllerAnimated:YES completion:NULL];
}

@end
