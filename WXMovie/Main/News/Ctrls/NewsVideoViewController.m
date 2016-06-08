//
//  NewsVideoViewController.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "NewsVideoViewController.h"
@interface NewsVideoViewController()<UITextViewDelegate>
{
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UITextView *textLabel;
}
@end

@implementation NewsVideoViewController

- (void)viewDidLoad
{
    imageView.image = [UIImage imageNamed:@"logo.jpg"];
    NSString *str = @"想看视频么？敬请关注无限互联官方网站www.wuxianedu.com,更多大牛iOS视频，高薪就业学员心得，各式APP制作尽在这里";
    textLabel.editable = NO;
    NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:30]}];
    [attstr addAttribute:NSLinkAttributeName value:@"http://www.wuxianedu.com" range:[str rangeOfString:@"www.wuxianedu.com"]];
    textLabel.attributedText = attstr;
    [super viewDidLoad];

}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
//    NSURL *url = [NSURL URLWithString:@"http://www.wuxianedu.com"];
    if ([[UIApplication sharedApplication] canOpenURL:URL]) {
        [[UIApplication sharedApplication] openURL:URL];

    }
    
    return NO;
    
}


@end
