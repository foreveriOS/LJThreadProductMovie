//
//  TopViewController.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "TopViewController.h"
#import "TopCollectionViewCell.h"
#import "TopDetailViewController.h"

//根据上面的信息自动计算上下左右间隙
#define kSpaceSize  (kScreenWidth-kItemWidth*kItemCount)/(kItemCount+1)

@interface TopViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *topFlowLayout;
@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Top250";
    
    [self loadData];
    
    [self configLayout];
}

-(void)configLayout
{
    self.topFlowLayout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    self.topFlowLayout.minimumLineSpacing = kSpaceSize;
    self.topFlowLayout.minimumInteritemSpacing = kSpaceSize;
    self.topFlowLayout.sectionInset = UIEdgeInsetsMake(kSpaceSize, kSpaceSize, kSpaceSize, kSpaceSize);
}

-(void)loadData
{
    _dataArr = [NSMutableArray array];
    
    NSDictionary *jsonDic = [WXDataService requestDataWithJsonFile:@"top250.json"];
    NSArray *jsonArray = [jsonDic objectForKey:@"subjects"];
    for (NSDictionary *dic in jsonArray) {
        TopModel *model = [[TopModel alloc] init];
        model.rating = dic[@"rating"];
        model.images = dic[@"images"];
        model.title = dic[@"title"];
        model.year = dic[@"year"];
        
        [_dataArr addObject:model];
    }
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


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kTopCollectionViewCellID" forIndexPath:indexPath];
    
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailViewController *viewCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"kTopDetailViewController"];
    [self.navigationController pushViewController:viewCtrl animated:YES];
}

@end
