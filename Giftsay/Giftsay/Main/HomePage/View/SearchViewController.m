//
//  SearchViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "SearchViewController.h"
#import "FuncTableViewCell.h"
#import "ItemsModel.h"
#import "ItemsViewController.h"

static NSString *searchCellId = @"searchCellId";

@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UITableView         *_tbView;
    NSInteger            _index;
    UISearchBar         *_searchBar;
    NSMutableArray      *_selectionDataArr;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _index = 0;
    _selectionDataArr = [NSMutableArray arrayWithCapacity:0];
    // 创建按钮
    [self createUI];
}

#pragma mark -- 创建按钮
- (void)createUI
{
    // 创建搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kWidth - 150, 40)];
    _searchBar.showsCancelButton = YES;
    _searchBar.placeholder = @"搜索";
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    
    
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 114)];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    _tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINib *nib = [UINib nibWithNibName:@"FuncTableViewCell" bundle:nil];
    [_tbView registerNib:nib forCellReuseIdentifier:searchCellId];
    [self.view addSubview:_tbView];
}

- (void)loadData {
    // 拼接参数
    NSString *url = [[NSString stringWithFormat:SEARCHURL,_searchBar.text,@"0"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [DataService requestUrl:url httpMethod:@"GET" params:nil block:^(id result) {
        NSLog(@"%@",result);
        //        "ad_monitors": [ ],
        //        "cover_image_url": "http://img02.liwushuo.com/image/150505/kei97t4a7.jpg-w640",
        //        "cover_webp_url": "http://img02.liwushuo.com/image/150505/kei97t4a7.jpg?imageView2/0/w/640/q/85/format/webp",
        //        "id": 1000453,
        //        "liked": false,
        //        "likes_count": 32060,
        //        "title": "香水控—男士香水篇"
        for (NSDictionary *dic in result[@"data"][@"posts"]) {
            ItemsModel *itemsModel = [[ItemsModel alloc] init];
            itemsModel.title = [dic objectForKey:@"title"];
            itemsModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
            itemsModel.url = [dic objectForKey:@"url"];
            itemsModel.identity = [[dic objectForKey:@"id"] integerValue];
            itemsModel.cover_webp_url = [dic objectForKey:@"cover_webp_url"];
            itemsModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            [_selectionDataArr addObject:itemsModel];
        }
        
        [_tbView reloadData];
    }];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _selectionDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FuncTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellId];
    cell.itemsModel = _selectionDataArr[indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsViewController *itemsVc = [[ItemsViewController alloc] init];
    ItemsModel *itemsModel = _selectionDataArr[indexPath.row];
    itemsVc.itemsModel = itemsModel;
    [self.navigationController pushViewController:itemsVc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

#pragma mark -- UISearchBarDelegate
#pragma mark 点击取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark 点击搜索按钮的代理方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (0 == searchBar.text.length) return;
    [searchBar resignFirstResponder];
    [self loadData];
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
