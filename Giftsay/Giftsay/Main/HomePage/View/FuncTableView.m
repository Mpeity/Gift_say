//
//  FuncTableView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncTableView.h"
#import "HeaderModel.h"
#import "FuncTableViewCell.h"
#import "ItemsModel.h"
#import "ItemsViewController.h"

static NSString *tableCellId = @"tableCellId";

@implementation FuncTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        _itemArray = [[NSMutableArray alloc] init];
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        UINib *nib = [UINib nibWithNibName:@"FuncTableViewCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:tableCellId];
        [self _loadDada];
        [self _createSubviews];
    }
    return self;
}

- (void)_createSubviews {
    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, -250, kWidth, 250)];
    self.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
    self.contentOffset = CGPointMake(0, 20);
    self.separatorStyle = NO;
    [self addSubview:_headerView];
}

// 获取数据 并解析
- (void)_loadDada {
    [DataService requestUrl:ITEMSURL httpMethod:@"GET" params:nil block:^(id result) {
//        NSLog(@"%@",result);
        NSArray *itemArray = [[result objectForKey:@"data"] objectForKey:@"items"];
        for (NSDictionary *dic in itemArray) {
            ItemsModel *itemsModel = [[ItemsModel alloc] init];
            itemsModel.editor_id = [dic objectForKey:@"editor_id"];
            itemsModel.title = [dic objectForKey:@"title"];
            itemsModel.url = [dic objectForKey:@"url"];
            itemsModel.content_url = [dic objectForKey:@"content_url"];
            itemsModel.share_msg = [dic objectForKey:@"share_msg"];
            itemsModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
            itemsModel.cover_webp_url = [dic objectForKey:@"cover_webp_url"];
            itemsModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            [_itemArray addObject:itemsModel];
        }
        [self reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FuncTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.itemsModel = _itemArray[indexPath.row];    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsViewController *itemsVc = [[ItemsViewController alloc] init];
    ItemsModel *itemsModel = _itemArray[indexPath.row];
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)next;
            itemsVc.itemsModel = itemsModel;
            [vc presentViewController:itemsVc animated:NO completion:nil];
            return;
        }
        next = next.nextResponder;
    }
}




@end
