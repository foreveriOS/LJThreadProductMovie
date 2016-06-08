//
//  HomeModel.h
//  WXMovie
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 {
 "box": 58040000,
 "new": true,
 "rank": 1,
 "subject": {
 "rating": {
 "max": 10,
 "average": 8.2,
 "stars": "45",
 "min": 0
 },
 "genres": [
 "动作",
 "科幻"
 ],
 "collect_count": 2347,
 "casts": [
 {
 "avatars": {
 "small": "http://img4.douban.com/img/celebrity/small/49.jpg",
 "large": "http://img4.douban.com/img/celebrity/large/49.jpg",
 "medium": "http://img4.douban.com/img/celebrity/medium/49.jpg"
 },
 "alt": "http://movie.douban.com/celebrity/1002667/",
 "id": "1002667",
 "name": "保罗·路德"
 },
 {
 "avatars": {
 "small": "http://img3.douban.com/img/celebrity/small/4023.jpg",
 "large": "http://img3.douban.com/img/celebrity/large/4023.jpg",
 "medium": "http://img3.douban.com/img/celebrity/medium/4023.jpg"
 },
 "alt": "http://movie.douban.com/celebrity/1053620/",
 "id": "1053620",
 "name": "迈克尔·道格拉斯"
 },
 {
 "avatars": {
 "small": "http://img4.douban.com/img/celebrity/small/4077.jpg",
 "large": "http://img4.douban.com/img/celebrity/large/4077.jpg",
 "medium": "http://img4.douban.com/img/celebrity/medium/4077.jpg"
 },
 "alt": "http://movie.douban.com/celebrity/1021963/",
 "id": "1021963",
 "name": "伊万杰琳·莉莉"
 }
 ],
 "title": "蚁人",
 "original_title": "Ant-Man",
 "subtype": "movie",
 "directors": [
 {
 "avatars": {
 "small": "http://img3.douban.com/img/celebrity/small/38984.jpg",
 "large": "http://img3.douban.com/img/celebrity/large/38984.jpg",
 "medium": "http://img3.douban.com/img/celebrity/medium/38984.jpg"
 },
 "alt": "http://movie.douban.com/celebrity/1009586/",
 "id": "1009586",
 "name": "佩顿·里德"
 }
 ],
 "year": "2015",
 "images": {
 "small": "http://img3.douban.com/view/movie_poster_cover/ipst/public/p2242302551.jpg",
 "large": "http://img3.douban.com/view/movie_poster_cover/lpst/public/p2242302551.jpg",
 "medium": "http://img3.douban.com/view/movie_poster_cover/spst/public/p2242302551.jpg"
 },
 "alt": "http://movie.douban.com/subject/1866473/",
 "id": "1866473"
 }
 }
 
 */
@interface HomeModel : NSObject

@property (nonatomic, strong) NSDictionary *rating; //评分

@property (nonatomic, strong) NSString *myDescription;

@property (nonatomic, copy) NSString *title; //电影标题

@property (nonatomic, copy) NSString *year; //年份

@property (nonatomic, copy) NSString *original_title; //原标题即英文标题

@property (nonatomic, strong) NSDictionary *images; //图片组


@end
