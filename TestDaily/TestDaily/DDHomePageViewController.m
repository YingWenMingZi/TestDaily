//
//  DDHomePageViewController.m
//  TestDaily
//
//  Created by huaat on 2017/10/13.
//  Copyright © 2017年 dengyuchi. All rights reserved.
//

#import "DDHomePageViewController.h"
#import "DDWechatViewController.h"

@interface DDHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray     *titleArray;

@end

@implementation DDHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.titleArray = [NSArray arrayWithObjects:@"微信发送", nil];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
}

-(void)initNav
{
    self.title = @"日常的练习";
    //滑动时隐藏searchBar
    self.navigationItem.hidesSearchBarWhenScrolling = true;
    //将searchController赋值给navigationItem
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.navigationItem.searchController = searchController;
}

#pragma --mark tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count + 19;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44 * DD_SCREEN_SCALE;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *title = @"";
    if(indexPath.row < self.titleArray.count)
    {
        title = [self.titleArray objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %@",indexPath.row + 1,title];
    return cell;
}

#pragma --mark tableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            DDWechatViewController *weChatVC = [[DDWechatViewController alloc]init];
            [self.navigationController pushViewController:weChatVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma --mark 懒加载
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView *view = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            view.backgroundColor = [UIColor whiteColor];
            view.delegate = self;
            view.dataSource = self;
            view;
        });
    }
    return _tableView;
}

@end
