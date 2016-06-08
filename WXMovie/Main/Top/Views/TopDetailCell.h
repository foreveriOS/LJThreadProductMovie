//
//  TopDetailCell.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface TopDetailCell : UITableViewCell

@property(nonatomic, weak)IBOutlet UIImageView *imgView;
@property(nonatomic, weak)IBOutlet UILabel *nickLabel;
@property(nonatomic, weak)IBOutlet UILabel *scoreLabel;
@property(nonatomic, weak)IBOutlet UILabel *cmmtLabel;

@property(nonatomic, strong)CommentModel *commentModel;

@end
