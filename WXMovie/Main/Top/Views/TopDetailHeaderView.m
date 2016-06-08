//
//  TopDetailHeaderView.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "TopDetailHeaderView.h"

@implementation TopDetailHeaderView

-(void)setModel:(TopDetailModel *)model
{
    _model = model;
    
    [movieImgView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    movieTitleLabel.text = _model.titleCn;
    enTitleLabel.text = _model.titleEn;
    movieContentView.text = _model.content;
    
    NSDictionary *dic1 = _model.videos[0];
    NSString *imgUrl1 = dic1[@"image"];
    UIImage *img1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl1]]];
    [button1 setImage:img1 forState:UIControlStateNormal];
    
    NSDictionary *dic2 = _model.videos[1];
    NSString *imgUrl2 = dic2[@"image"];
    UIImage *img2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl2]]];
    [button2 setImage:img2 forState:UIControlStateNormal];
    
    NSDictionary *dic3 = _model.videos[2];
    NSString *imgUrl3 = dic3[@"image"];
    UIImage *img3 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl3]]];
    [button3 setImage:img3 forState:UIControlStateNormal];
    
    NSDictionary *dic4 = _model.videos[3];
    NSString *imgUrl4 = dic4[@"image"];
    UIImage *img4 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl4]]];
    [button4 setImage:img4 forState:UIControlStateNormal];
    
    [self layoutIfNeeded];
}

- (IBAction)showMoviePlayer:(UIButton *)sender {
    NSInteger index = sender.tag - 100;
    NSDictionary *dic = _model.videos[index];
    NSString *url = dic[@"url"];
    
    AVPlayerViewController *moviePlayer = [[AVPlayerViewController alloc] init];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
    
    moviePlayer.player = player;
    [player play];
    [self.viewController presentViewController:moviePlayer animated:YES completion:NULL];
}

@end
