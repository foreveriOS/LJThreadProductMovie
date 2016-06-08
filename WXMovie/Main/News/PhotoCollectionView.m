//
//  PhotoCollectionView.m
//  WXMovie
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"

@implementation PhotoCollectionView

- (instancetype)init
{

    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        self.pagingEnabled = YES;
        
//        [self registerNib:[UINib nibWithNibName:<#(nonnull NSString *)#> bundle:<#(nullable NSBundle *)#>] forCellWithReuseIdentifier:<#(nonnull NSString *)#>]
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"PhotoCellID"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCellID" forIndexPath:indexPath];
    
    cell.imgUrlStr = self.dataArray[indexPath.row];
    
    return cell;
}






@end
