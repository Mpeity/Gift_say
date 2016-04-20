//
//  HeaderView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "HeaderView.h"
#import "HeaderModel.h"
#import "TargetModel.h"
#import "NextModel.h"

static NSString *cellId = @"cell";

@implementation HeaderView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _headerArray = [[NSMutableArray alloc] init];
        _nextModelArray = [[NSMutableArray alloc] init];
        [self _createSubviews];
        [self _createCollectionView];
        [self _loadDada];
    }
    return self;
}


#pragma mark - 创建tableView的头部视图
- (void)_createSubviews{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height*0.65)];
    _scrollView.contentSize = CGSizeMake(self.width*4, self.height*0.65);
    _scrollView.contentOffset = CGPointMake(0, 0); // 设置滚动的偏移量
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    [DataService requestUrl:BANNERURL httpMethod:@"GET" params:nil block:^(id result) {
        NSArray *bannersArray = [[result objectForKey:@"data"] objectForKey:@"banners"];
        for (NSDictionary *dic in bannersArray) {
            HeaderModel *headerModel = [[HeaderModel alloc] init];
            headerModel.image_url = [dic objectForKey:@"image_url"];
            [_headerArray addObject:headerModel];
        }
        for (int i = 0; i<self.headerArray.count; i++) {
            HeaderModel *headerModel = [[HeaderModel alloc] init];
            headerModel = _headerArray[i];
            NSString *imageName = [NSString stringWithFormat:@"%@",headerModel.image_url];
            NSLog(@"%@",imageName);
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, self.height*0.65)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:headerModel.image_url]];
            imgView.userInteractionEnabled = YES;
            [_scrollView addSubview:imgView];
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, kHeight*0.40)];
            button.tag = 100+i;
            button.backgroundColor = [UIColor clearColor];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:button];
        }
    }];
}

// 获取数据 并解析
- (void)_loadDada {
    [DataService requestUrl:PROMOTIONURL httpMethod:@"GET" params:nil block:^(id result) {
        NSArray *promotionsArray = [[result objectForKey:@"data"] objectForKey:@"promotions"];
        for (NSDictionary *dic in promotionsArray) {
            NextModel *nextModel = [[NextModel alloc] init];
            nextModel.icon_url = [dic objectForKey:@"icon_url"];
            [_nextModelArray addObject:nextModel];
        }
        [_collectionView reloadData];
    }];
}

- (void)buttonAction:(UIButton *)button {
    NSLog(@"11111");
}




#pragma mark - scrollViewDelegate


#pragma mark - collectionView
- (void)_createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.height-_scrollView.height-20, self.height-_scrollView.height-20);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _scrollView.height, kWidth, self.height-_scrollView.height) collectionViewLayout:layout];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:_collectionView];
}

#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _nextModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.width, cell.height)];
    NextModel *nextModel = [[NextModel alloc] init];
    nextModel = _nextModelArray[indexPath.row];
    [imgView sd_setImageWithURL:[NSURL URLWithString:nextModel.icon_url]];
    [cell.contentView addSubview:imgView];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 20, 10, 20);
}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
