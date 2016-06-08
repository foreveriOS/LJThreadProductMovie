//
//  TopDetailHeaderView.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopDetailModel.h"

@interface TopDetailHeaderView : UIView
{
    
    __weak IBOutlet UIImageView *movieImgView;
    __weak IBOutlet UITextView *movieContentView;
    __weak IBOutlet UILabel *movieTitleLabel;
    __weak IBOutlet UILabel *enTitleLabel;
    __weak IBOutlet UIButton *button1;
    __weak IBOutlet UIButton *button2;
    __weak IBOutlet UIButton *button3;
    __weak IBOutlet UIButton *button4;
}

@property(nonatomic, strong)TopDetailModel *model;

@end
