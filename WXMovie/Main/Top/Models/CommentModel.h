//
//  CommentModel.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "BaseModel.h"


/*
 {
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content" : "儿子很喜欢 一直期盼上映"
 },
 */
@interface CommentModel : BaseModel

@property(nonatomic, copy)NSString* userImage;
@property(nonatomic, copy)NSString* nickname;
@property(nonatomic, copy)NSString* rating;
@property(nonatomic, copy)NSString* content;

@end
