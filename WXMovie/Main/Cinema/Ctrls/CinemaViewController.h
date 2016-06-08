//
//  CinemaViewController.h
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    
    /*
     district_list：
     {
     "name" : "东城区",
     "id" : "1029"
     }
     */
    NSArray *districtArr;
    
    
    
    
    
    /*
     {
     "1029" :
         [
             影院model1,
             影院model2,
             影院model3,
             影院model4,
             影院model5
         ]
     }
     */
    NSMutableDictionary *cinemaDic;
}



@end
