//
//  BaseModel.h
//  WXMovie
//
//  Created by JayWon on 15/9/14.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import <Foundation/Foundation.h>


//作用是字典自动转换成model对象
@interface BaseModel : NSObject

-(id)initWithDic:(NSDictionary *)dic;

@end
