//
//  NewsViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "NewsViewController.h"
//#import "StarViewCode.h"
#import "NewsModel.h"
#import "NewsCell.h"

#define kHeadViewHeight 200

#define  kOverlapHeight MAX(0, 100)

#define  kOverlapWidth (kOverlapHeight * kScreenWidth / kHeadViewHeight)

@interface NewsViewController ()
{
    NSMutableArray *_dataArr;
    UIImageView *headerImageView;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow"]];
//    StarViewCode *view = [[StarViewCode alloc] initWithFrame:CGRectMake(0, 0, 20, 100)];
//    [self.view addSubview:view];

//    数据解析
    [self _loadData];
//    界面创建
    [self _configUI];
//    数据加载
}

- (void)_loadData
{
    _dataArr = [NSMutableArray array];
    
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news_list.json" ofType:nil] ]options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dic in arr) {
        NewsModel *model = [[NewsModel alloc] init];
        
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.image = dic[@"image"];
        model.newsid = [dic[@"newsid"] integerValue];
        model.newsType = (NewsType)[dic[@"type"] integerValue];
        
        [_dataArr addObject:model];
    }
}

- (void)_configUI
{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = kTableViewSeColor;
    self.tableView.rowHeight = 100;
    
    NewsModel *model = _dataArr[0];
    headerImageView = [[UIImageView alloc] init];
    headerImageView.frame = CGRectMake(-kOverlapWidth / 2, 64, kScreenWidth + kOverlapWidth, kOverlapHeight + kHeadViewHeight);
    [headerImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    [_dataArr removeObjectAtIndex:0];
    

    [self.view insertSubview:headerImageView belowSubview:self.tableView];
    
    //注册单元格
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kHeadViewHeight)];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //y坐标的偏移量
    CGFloat ofy = scrollView.contentOffset.y;
    CGFloat top = scrollView.contentInset.top;
//    CGFloat y = ofy + top;
//    NSLog(@"%f,%f", ofy,top);
//    NSLog(@"%f", y);
    if (ofy <= 0 - top) { //向下滑动，图片放大
        //对imageframe修改，需要改哪些值？
        //        transform 中心点放大，不好用
        //        imageView.transform = CGAffineTransformMakeScale((150 - y) / 150, (150 - y) / 150);
        CGFloat width =  kScreenWidth * (kHeadViewHeight -ofy - top)/kHeadViewHeight + kOverlapWidth;//屏幕宽度*放大倍率
        CGFloat height = kHeadViewHeight - ofy - top + kOverlapHeight;
        headerImageView.frame = CGRectMake((kScreenWidth - width) / 2, 64, width, height);
    }else // 向上滑动，图片推到屏幕上面
    {
        headerImageView.top = -ofy-top + 64;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到对应的cell
    NewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];

//    switch case 语句当中 会造成系统当中的数据应用失败
    NSString *viewCtrlID = nil;
    switch (cell.model.newsType) {
        case WordType:
            //弹到文字新闻界面
            viewCtrlID = @"NewsWordViewController";
            break;
        case ImageType:
            //弹到图片新闻界面
            viewCtrlID = @"NewsImageViewController";

            break;
        case VideoType:
            //弹到视频新闻界面
             viewCtrlID = @"NewsVideoViewController";
            break;
        default:
            return ;
            break;
    }
    UIViewController *viewCtrl = [self.storyboard instantiateViewControllerWithIdentifier:viewCtrlID];
    //隐藏底部标签栏，当push的时候
    viewCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewCtrl animated:YES];

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
