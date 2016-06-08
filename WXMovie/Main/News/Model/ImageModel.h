//
//  ImageModel.h
//  WXMovie
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <Foundation/Foundation.h>

//{
//    "id": 2251763,
//    "image": "http://img31.mtime.cn/pi/2013/03/08/144834.57830377_1280X720.jpg",
//    "type": 6
//}

@interface ImageModel : NSObject

@property (nonatomic, assign) NSInteger imageId;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, assign) NSInteger type;

@end
