//
//  MoreViewController.m
//  WXMovie
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 无限互联. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSString *userName;
    UIImage *userIcon;
}
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getDataFromSandBox];

    self.navigationItem.title = @"更多";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    self.tableView.separatorColor = kTableViewSeColor;
    //    self.tableView.separatorInset = UIEdgeInsetsMake(10, 15, 0, 0);
    //    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    //    self.tableView.tableHeaderView.backgroundColor = [UIColor greenColor];
    //    NSHomeDirectory()通过这个方法 找到当前 文件的沙盒
    NSLog(@"%@", NSHomeDirectory());
    //找到缓存-》 计算大小 -》 点击这个cell ——》弹出AlertView -》 确定清除缓存 ——》 刷新界面
    
    //创建头视图
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:userIcon forState:UIControlStateNormal];
    [button setTitle:@"编辑" forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(25, 25, 100, 100);
    button.layer.cornerRadius = 50;
    button.layer.masksToBounds = YES;
    button.tag = 2016;
    
    [headerView addSubview:button];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 25, 200, 40)];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor yellowColor];
    nameLabel.text = userName;
    nameLabel.tag = 2017;
    
    [headerView addSubview:nameLabel];
 
    self.tableView.tableHeaderView = headerView;
    
    //    NULL nil Nil [NSNull null] 0 0 0 <null> (null) (null) (null) <null>

//    NSLog(@"%d %d %d %@ %@ %@ %@ %@",  NULL, nil, Nil ,[NSNull null],NULL, nil, Nil ,[NSNull null]);
//    
////    0x0 0x30 0x41 48 65 0x61 97 0xbfff 0x7fff5fa00778
    
}

- (void)buttonAction:(UIButton *)sender
{
    //配置相片来源类型 -》 弹出相册 -》 选择图片 -》 返回选择的图片 —》 配置给button
    //来源为保存的图片
    //图片来源
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //弹出相册
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self readCatchSize];
    //    [self getDataFromSandBox];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //    [self saveDataToSandBox];
}

- (void)readCatchSize
{
    //    NSInteger fileSize = [[SDImageCache sharedImageCache] getSize];
    NSInteger fileSize = [self getCatchSize];
    NSLog(@"%ld", fileSize);
    
    self.sizeLabel.text = [NSString stringWithFormat:@"%.2f MB", fileSize / 1024.0 / 1024.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"确定清除缓存%@", self.sizeLabel.text] preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            self.sizeLabel.text = @"0.0 MB";
            //            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            //        [self.tableView reloadSections:<#(nonnull NSIndexSet *)#> withRowAnimation:<#(UITableViewRowAnimation)#>];
            //            [[SDImageCache sharedImageCache] clearDisk];
            [self clearCatch];
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
        
        [self presentViewController:alert animated:YES completion:NULL];
    }
}

- (NSInteger)getCatchSize
{
    NSInteger fileSize = 0;
    
    //    NSDirectoryEnumerator *fileEnumerator = [_fileManager enumeratorAtPath:self.diskCachePath];
    //    for (NSString *fileName in fileEnumerator) {
    //        NSString *filePath = [self.diskCachePath stringByAppendingPathComponent:fileName];
    //        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    //        size += [attrs fileSize];
    //拿到对应目录下的所有文件名
    //    NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Users/apple/Desktop/88/项目一" error:NULL];
    //        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:NSHomeDirectory()];
    ////    NSLog(@"%@", fileEnumerator[0].fileName);
    //    for (NSString *fileName in fileEnumerator) {
    //        NSLog(@"%@", fileName);
    //    }
    //拿到缓存文件夹
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //拿到缓存文件夹下的所有文件的属性
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:catchPath];
    //所有的文件的名称
    for (NSString *fileName in fileEnumerator) {
        //所有文件的路径
        NSString *filePath = [catchPath stringByAppendingPathComponent:fileName];
        //所有文件的大小
        NSDictionary *attDic = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        //   计算大小
        fileSize += [attDic fileSize];
    }
    
    return fileSize;
}

- (void)clearCatch
{
    //拿到缓存文件夹
    NSString *catchPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //清除
    [[NSFileManager defaultManager] removeItemAtPath:catchPath error:NULL];
}
//获取图片的delegate 在相册当中选择图片时调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    //获取需要设置的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    userIcon = image;
    UIButton *button = [self.tableView.tableHeaderView viewWithTag:2016];
    
    [button setImage:userIcon forState:UIControlStateNormal];
    
    UILabel *label = [self.tableView.tableHeaderView viewWithTag:2017];
    userName = @"爱你久久";
    label.text = userName;
    
    [self saveDataToSandBox];
}

//保存数据到沙盒当中
- (void)saveDataToSandBox
{
    if (userIcon != nil) {
        //系统设定的类，用于app的一些基础设置 plist ， 归档 ， 数据库 ， CoreData
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //一定要转换成Data 第二个参数表示压缩比率0 最大 1 最小
        NSData *data = UIImageJPEGRepresentation(userIcon, 0.8);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"userIcon"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

//从沙盒当中获取数据
- (void)getDataFromSandBox
{
    userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    userIcon = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"userIcon"]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
