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


static NSString *tableCellId = @"tableCellId";
static NSString *collectionCellId = @"collectionCellId";

@implementation StrategyView
{
    UITableView *_strategTableView;
    UIView *_headerView;
    NSMutableArray *_specialArray;
    UICollectionView *_specialCollectionView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _funcInitialize];
        [self _loadData];
        [self _createSubviews];
        [self _createHeaderView];
    }
    return self;
}

// 初始化数组、字典。。。
- (void)_funcInitialize {
    _specialArray = [[NSMutableArray alloc] init];
}

#pragma mark - createSubviews
- (void)_createSubviews {
    _strategTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [_strategTableView registerClass:[StrateTableViewCell class] forCellReuseIdentifier:tableCellId];
    _strategTableView.delegate = self;
    _strategTableView.dataSource = self;
    _strategTableView.backgroundColor = [UIColor ivoryColor];
    [self addSubview:_strategTableView];
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight*0.20)];
    _headerView.backgroundColor = [UIColor whiteColor];
    [_strategTableView addSubview:_headerView];

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
- (void)_loadData {
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
    
    [DataService requestUrl:CHANNELURL httpMethod:@"GET" params:nil block:^(id result) {
        NSLog(@"%@",result);
    }];
    
    
}

#pragma mark - buttonAction
- (void)allButtonAction:(UIButton *)button {
    NSLog(@"111111");
}




#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StrateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellId forIndexPath:indexPath];
    return cell;
}


#pragma mark - CollectionViewDelegte

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _specialArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:cell.bounds];
    SpecialModel *specialMode = _specialArray[indexPath.row];
    [imgView sd_setImageWithURL:[NSURL URLWithString:specialMode.banner_image_url]];
    [cell.contentView addSubview:imgView];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}












/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
