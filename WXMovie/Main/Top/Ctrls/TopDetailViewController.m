//
//  TopDetailViewController.m
//  WXMovie
//
//  Created by wenyuan on 4/7/16.
//  Copyright © 2016 无限互联. All rights reserved.
//

#import "TopDetailViewController.h"
#import "TopDetailCell.h"
#import "TopDetailHeaderView.h"

#define kTableViewRowHeight 80

@interface TopDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tbView;
@property(nonatomic, strong)NSMutableArray *commentArr;
@property(nonatomic, strong)NSIndexPath *selectIndexPath;   //选中的 indexPath

@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.解析json -> model
    //2.初始化header view
    //3.tableview的代理方法 -> cell
    
    [self createUI];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{
    //解析header 数据
    NSDictionary *detailDic = [WXDataService requestDataWithJsonFile:@"movie_detail.json"];
    TopDetailModel *detailModel = [[TopDetailModel alloc] initWithDic:detailDic];
    headerView.model = detailModel;
//    NSLog(@"%@", detailModel);
    
    //解析评论数据
    _commentArr = [NSMutableArray array];
    NSDictionary *cmmtDic = [WXDataService requestDataWithJsonFile:@"movie_comment.json"];
    NSArray *listArr = cmmtDic[@"list"];
    for (NSDictionary *dic in listArr) {
        CommentModel *model = [[CommentModel alloc] initWithDic:dic];
        [_commentArr addObject:model];
    }
//    NSLog(@"%ld", _commentArr.count);
}

//使用了autolayout之后在viewctrl里获取uiview的frame，重写viewDidLayoutSubviews方法
-(void)viewDidLayoutSubviews
{
    
}

-(void)createUI
{
    headerView = [[[NSBundle mainBundle] loadNibNamed:@"TopDetailHeaderView" owner:self options:nil] firstObject];
    self.tbView.tableHeaderView = headerView;
    self.tbView.separatorColor = kTableViewSeColor;
    [self.tbView registerNib:[UINib nibWithNibName:@"TopDetailCell" bundle:nil] forCellReuseIdentifier:@"kTopDetailCellID"];
    
    /*
     // iOS 8 self-resizing cell
     //预估的单元格的高度
     self.tbView.estimatedRowHeight = kTableViewRowHeight;
     //iOS 8 自适应的单元格(1.先补充全自动布局 2.设置estimatedRowHeigh属性 3.rowHeight = UITableViewAutomaticDimension)
     self.tbView.rowHeight = UITableViewAutomaticDimension;
    */
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kTopDetailCellID" forIndexPath:indexPath];
    
    cell.commentModel = self.commentArr[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectIndexPath isEqual:indexPath]) {
        //求label文字的高度
        CommentModel *model = self.commentArr[indexPath.row];
        
        /*
         NSStringDrawingUsesLineFragmentOrigin 表示可以换行
         NSStringDrawingUsesFontLeading 计算行高时使用行间距。（字体大小+行间距=行高）
         NSStringDrawingUsesDeviceMetrics 使用设备的字体（如果不设置，使用的印刷字体）
         NSStringDrawingTruncatesLastVisibleLine
         最后一行如果超出范围，自动变为省略号(如果不换行，没有效果)
         */
        
        NSDictionary *arrtDic = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
        CGRect frame = [model.content
                        boundingRectWithSize:CGSizeMake(kScreenWidth-114, 2000)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:arrtDic
                        context:nil];
        
        //height为cell的高度，frame.size.height为contentLabel的高度，还得加上contentLabel的y坐标49和底部10个像素的间隙
        CGFloat height = MAX(frame.size.height + 49 + 10 , kTableViewRowHeight);
        return height;
    }else{
        return kTableViewRowHeight;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![_selectIndexPath isEqual:indexPath]) {
        self.selectIndexPath = indexPath;
        
        //刷新选中的cell
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
