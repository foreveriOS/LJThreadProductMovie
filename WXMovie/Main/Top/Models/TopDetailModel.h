//
//  TopDetailModel.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "BaseModel.h"

@interface TopDetailModel : BaseModel

//image
//titleCn
//titleEn
//rating
//year
//content
//type
//url
//directors
//actors
//release
////"location" :
////"date" : "20
////,
//imageCount
//images
//videoCount
//videos

@property (nonatomic,copy)NSString *image;
@property (nonatomic,copy)NSString *titleCn;
@property (nonatomic,copy)NSString *titleEn;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,strong)NSArray *videos;

@end
