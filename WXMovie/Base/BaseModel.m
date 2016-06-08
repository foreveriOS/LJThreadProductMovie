//
//  BaseModel.m
//  WXMovie
//
//  Created by JayWon on 15/9/14.
//  Copyright (c) 2015年 JayWon. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self buildRelationship:dic];
    }
    
    return self;
}

-(SEL)changeKeyToSetKey:(NSString *)key
{

    //2
    NSString *firstStr = [[key substringToIndex:1] uppercaseString];
    NSString *otherStr = [key substringFromIndex:1];
    
    //id特殊处理
    NSString *setterStr = nil;
    if ([key isEqualToString:@"id"]) {
        setterStr = [NSString stringWithFormat:@"set%@%@%@:", NSStringFromClass([self class]), firstStr, otherStr];
    }else{
        setterStr = [NSString stringWithFormat:@"set%@%@:", firstStr, otherStr];
    }
    
    //3
    return NSSelectorFromString(setterStr);
}

//- (NSDictionary *)mapAtt:(NSDictionary *)dic
//{
////    匹配字符串
//    NSDictionary *nameDic = @{
//                            @"description"  : @"myDescription"
//                              };
//    
////}
//
//- (NSString *)mapString:(NSString *)str
//{
//    return [NSString stringWithFormat:@"my%@",[str capitalizedString]];
//}

-(void)buildRelationship:(NSDictionary *)dic
{
    //1.拿到所有的key
    //2.把key变成setKey字符串
    //3.把setKey字符串转换成方法
    //4.把dic里面的value赋值给setKey
    
    //1
    NSArray *allKeys = [dic allKeys];
    for (NSString *key in allKeys) {
//        description -> myDescription
        SEL method = [self changeKeyToSetKey:key];
        
        //4
        id value = dic[key];
        if ([self respondsToSelector:method]) {
            [self performSelector:method withObject:value];
        }
    }
}

@end
