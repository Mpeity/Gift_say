//
//  StrategyView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/17.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "StrategyView.h"
#import "StrateTableViewCell.h"
#import "SpecialModel.h"
#import "UIImageView+WebCache.h"
#import "CommonModel.h"
#import "ChannelsModel.h"
#import "TotalViewController.h"
#import "HeaderViewController.h"


static NSString *tableCellId = @"tableCellId";
static NSString *collectionCellId = @"collectionCellId";

@implementation StrategyView
{
    UITableView *_strategTableView;
    UIView *_headerView;
    NSMutableArray *_specialArray;
    NSMutableArray *_commonArray;
    UICollectionView *_specialCollectionView;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _funcInitialize];
        [self _createSubviews];
        [self _createHeaderView];
        [self _loadCommonData];
        [self _loadHeaderData];
    }
    return self;
}

// 初始化数组、字典。。。
- (void)_funcInitialize {
    _specialArray = [[NSMutableArray alloc] init];
    _commonArray = [[NSMutableArray alloc] init];

}

#pragma mark - createSubviews
- (void)_createSubviews {

//    [self addSubview:_headerView];
    _strategTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-100) style:UITableViewStylePlain];
    [_strategTableView registerClass:[StrateTableViewCell class] forCellReuseIdentifier:tableCellId];
    _strategTableView.delegate = self;
    _strategTableView.dataSource = self;
    _strategTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _strategTableView.showsVerticalScrollIndicator = NO;
    _strategTableView.backgroundColor = [UIColor aliceBlue];
    [self addSubview:_strategTableView];
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight*0.20)];
    _headerView.backgroundColor = [UIColor whiteColor];
    _strategTableView.tableHeaderView = _headerView;
    _strategTableView.contentOffset = CGPointMake(0, 0);
    _strategTableView.contentSize = CGSizeMake(kWidth, 1500);

}

- (void)_createHeaderView {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, _headerView.height/4)];
    [_headerView addSubview:header];
    header.backgroundColor = [UIColor clearColor];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 2*header.height, header.height)];
    textLabel.text = @"专题";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor blackColor];
    textLabel.font = [UIFont systemFontOfSize:15];
    [header addSubview:textLabel];
    UIButton *allButton = [[UIButton alloc] initWithFrame:CGRectMake(header.width-header.height*3, 0, header.height*3, header.height)];
    allButton.backgroundColor = [UIColor clearColor];
    [allButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [header addSubview:allButton];
    [allButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [allButton addTarget:self action:@selector(allButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(_headerView.height*0.55*1.8, _headerView.height*0.55);
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _specialCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _headerView.height*0.35, kWidth, _headerView.height*0.55) collectionViewLayout:layout];
    _specialCollectionView.showsHorizontalScrollIndicator = NO;
    [_specialCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellId];
    _specialCollectionView.delegate = self;
    _specialCollectionView.dataSource = self;
    [_headerView addSubview:_specialCollectionView];
    _specialCollectionView.backgroundColor = [UIColor clearColor];
}

#pragma mark - LoadData
//@property (nonatomic,copy) NSString *cover_image_url; //
//@property (nonatomic,assign) NSInteger identity; //
//@property (nonatomic,assign) NSInteger posts_count; //
//@property (nonatomic,copy) NSString *banner_image_url; //
//@property (nonatomic,copy) NSString *subtitle; //
//@property (nonatomic,copy) NSString *title; //
- (void)_loadHeaderData {
    [DataService requestUrl:@"http://api.liwushuo.com/v1/collections?channel=104" httpMethod:@"GET" params:nil block:^(id result) {
//        NSLog(@"%@",result);
        NSArray *dataArray = [[result objectForKey:@"data"] objectForKey:@"collections"];
        for (NSDictionary *dic in dataArray) {
            SpecialModel *specialModel = [[SpecialModel alloc] init];
            specialModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            specialModel.identity = [[dic objectForKey:@"id"] integerValue];
            specialModel.posts_count = [[dic objectForKey:@"posts_count"] integerValue];
            specialModel.banner_image_url = [dic objectForKey:@"banner_image_url"];
            specialModel.subtitle = [dic objectForKey:@"subtitle"];
            specialModel.title = [dic objectForKey:@"title"];
            [_specialArray addObject:specialModel];
        }
//        NSLog(@"%@",_specialArray);
        [_specialCollectionView reloadData];
    }];
    

}

- (void)_loadCommonData {
    //    @property (nonatomic,assign) NSInteger order;
    //    @property (nonatomic,copy) NSString *name;
    //    @property (nonatomic,assign) NSInteger *group_id;
    //    @property (nonatomic,assign) NSString *identity;
    //    @property (nonatomic,copy) NSString *icon_url;
    //    @property (nonatomic,copy) NSString *icon_name;

    [DataService requestUrl:CHANNELURL httpMethod:@"GET" params:nil block:^(id result) {
//        NSLog(@"%@",result);
        NSArray *commonArray = [[result objectForKey:@"data"] objectForKey:@"channel_groups"];
        for (NSDictionary *dic in commonArray) {
            CommonModel *commonModel = [[CommonModel alloc] init];
            commonModel.groupArray = [[NSMutableArray alloc] init];
            commonModel.order = [[dic objectForKey:@"order"] integerValue];
            commonModel.name = [dic objectForKey:@"name"];
            commonModel.identity = [[dic objectForKey:@"id"] integerValue];
            NSArray *channelsArray = [dic objectForKey:@"channels"];
            for (NSDictionary *dataDic in channelsArray) {
                ChannelsModel *channelsModel = [[ChannelsModel alloc] init];
                channelsModel.group_id = [[dataDic objectForKey:@"group_id"] integerValue];
                channelsModel.identity = [[dataDic objectForKey:@"id"] integerValue];
                channelsModel.icon_name = [dataDic objectForKey:@"name"];
                channelsModel.icon_url = [dataDic objectForKey:@"icon_url"];
                channelsModel.items_count = [[dataDic objectForKey:@"items_count"] integerValue];
                [commonModel.groupArray addObject:channelsModel];
            }
            [_commonArray addObject:commonModel];
        }
        [_strategTableView reloadData];
    }];
}

#pragma mark - buttonAction(查看全部)
- (void)allButtonAction:(UIButton *)button {
    TotalViewController *totalVC = [[TotalViewController alloc] init];
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            //沿着响应者链可以找到vc
            UIViewController *vc = (UIViewController *)next;
            [vc.navigationController pushViewController:totalVC animated:NO];
            return;
        }
        next = next.nextResponder;
    }
}


#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _commonArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StrateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor aliceBlue];
    cell.commonModel = _commonArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 420;
    }
    if (indexPath.row == 1) {
        return 300;
    }
    if (indexPath.row == 2) {
        return 535;
    }
    if (indexPath.row == 3) {
        return 300;
    }
    return 0;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y<0) {
        CGFloat y = 0;
        scrollView.contentOffset = CGPointMake(0, y);
    }
}

#pragma mark - CollectionViewDelegte

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _specialArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:cell.bounds];
    SpecialModel *specialModel = _specialArray[indexPath.row];
    [imgView sd_setImageWithURL:[NSURL URLWithString:specialModel.banner_image_url]];
    [cell.contentView addSubview:imgView];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HeaderViewController *headerVC = [[HeaderViewController alloc] init];
    SpecialModel *specialModel = _specialArray[indexPath.row];
    headerVC.specialModel = specialModel;
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            //沿着响应者链可以找到vc
            UIViewController *vc = (UIViewController *)next;
            [vc.navigationController pushViewController:headerVC animated:NO];
            return;
        }
        next = next.nextResponder;
    }

}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
