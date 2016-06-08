//
//  PhotoViewController.m
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoFlowLayout.h"
#import "PhotoCollectionView.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //思路collectionView -> cell layout -> imageView
    [self _createSubViews];
}

- (void)_createSubViews
{
    PhotoFlowLayout *layout = [[PhotoFlowLayout alloc] init];
    PhotoCollectionView *photoColView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width , self.view.height) collectionViewLayout:layout];
    photoColView.dataArray = self.imageURLArr;
    [self.view addSubview:photoColView];
    //滑到中间
    [photoColView scrollToItemAtIndexPath:_selectIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
