//
//  TopDetailCell.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "TopDetailCell.h"

@implementation TopDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCommentModel:(CommentModel *)commentModel
{
    _commentModel = commentModel;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_commentModel.userImage]];
    _nickLabel.text = _commentModel.nickname;
    _scoreLabel.text = _commentModel.rating;
    _cmmtLabel.text = _commentModel.content;
    
    
    /*
    autolayout之后获取uiview正确的frame，调用uiview的layoutIfNeeded
    _cmmtLabel使用了自动布局，调用了layoutIfNeeded才能正确获取_cmmtLabel的frame
    */
//    [_cmmtLabel layoutIfNeeded];
//    NSLog(@"%f", kScreenWidth - _cmmtLabel.width);
}

@end
