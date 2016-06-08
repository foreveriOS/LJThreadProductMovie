//
//  CinemaViewController.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaCell.h"
#import "SectionHeaderView.h"

@interface CinemaViewController ()
{
    BOOL status[30];
}

@property (weak, nonatomic) IBOutlet UITableView *tbView;
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"影院";
    self.navigationController.navigationBar.translucent = NO;
    
    //1.解析数据
    //2.UI(uitableview, cell)
    //3.逻辑
    
    [self loadData];
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createUI
{
    self.tbView.separatorColor = kTableViewSeColor;
    [self.tbView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:@"kCinemaCellID"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)loadData
{
    //district_list.json
    NSDictionary *districtDic = [WXDataService requestDataWithJsonFile:@"district_list.json"];
    districtArr = districtDic[@"districtList"];
    
    
    
    //cinema_list.json
    cinemaDic = [NSMutableDictionary dictionary];
    
    NSDictionary *listDic = [WXDataService requestDataWithJsonFile:@"cinema_list.json"];
    NSArray *listArr = listDic[@"cinemaList"];
    
    for (NSDictionary *dic in listArr) {
        CinemaModel *model = [[CinemaModel alloc] initWithDic:dic];
        
        //把model分类，把相同districtId的model放一起
        NSString *districtId = model.districtId;
        
        //去cinimaDic查找是否districtId已经被创建了
        NSMutableArray *cinemaArr = [cinemaDic objectForKey:districtId];
        if (cinemaArr == nil) {
            //如果没找到就创建一个空的数组
            cinemaArr = [NSMutableArray array];
            //把空的数组和对应的districtId放到字典里面
            [cinemaDic setObject:cinemaArr forKey:districtId];
        }
        //把model添加到数组里面
        [cinemaArr addObject:model];
    }
}

-(void)clickSectionHeader:(UIControl *)headView
{
    NSInteger section = headView.tag - 1000;
    status[section] = !status[section];
    
    [self.tbView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return districtArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!status[section]) {
        return 0;
    }
    
    NSDictionary *dic = districtArr[section];
    NSString *districtID = dic[@"id"];
    NSArray *arr = cinemaDic[districtID];
    return arr.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"kCinemaHeaderFooterViewID"];
    if (headerView == nil) {
        headerView = [[SectionHeaderView alloc] initWithReuseIdentifier:@"kCinemaHeaderFooterViewID"];

        //添加点击事件
        [headerView.ctrlView addTarget:self action:@selector(clickSectionHeader:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    headerView.ctrlView.tag = 1000+section;
    
    NSDictionary *dic = districtArr[section];
    headerView.titleLabel.text = dic[@"name"];
    
    return headerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCinemaCellID" forIndexPath:indexPath];
    
    NSDictionary *dic = districtArr[indexPath.section];
    NSString *districtID = dic[@"id"];
    NSArray *arr = cinemaDic[districtID];
    cell.model = arr[indexPath.row];
    
    return cell;
}

@end
