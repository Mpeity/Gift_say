//
//  GiftView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/17.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "GiftView.h"
#import "FavoriteCollectionViewCell.h"
#import "MJRefresh.h"
#import "FavoriteDetailViewController.h"

static NSString *cell_Id = @"cell_Id";

@implementation GiftView
{
    NSString *_pagingStr; // 加载更多数据链接字符串
}

//http://www.liwushuo.com/posts?tab=occasion&scene_id=35 乔迁
//http://www.liwushuo.com/posts?tab=occasion&scene_id=32  情人节
//http://www.liwushuo.com/posts?tab=occasion&scene_id=36  感谢
//http://www.liwushuo.com/posts?tab=occasion&scene_id=33  结婚
//http://www.liwushuo.com/posts?tab=occasion&scene_id=31 纪念日
//http://www.liwushuo.com/posts?tab=occasion&scene_id=30 生日
//http://www.liwushuo.com/posts?tab=occasion&scene_id=39 新年

//http://api.liwushuo.com/v2/items/%@

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {        
        [self _loadData];
        _favoriteArray = [[NSMutableArray alloc] init];
        _favoriteDic = [[NSMutableDictionary alloc] init];
        [self _createSubviews];
    }
    return self;
}


- (void)_createSubviews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kWidth-30)/2, (kWidth-30)*3/4);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    _favoriteCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) collectionViewLayout:layout];
    UINib *nib = [UINib nibWithNibName:@"FavoriteCollectionViewCell" bundle:[NSBundle mainBundle]];
    [_favoriteCollectionView registerNib:nib forCellWithReuseIdentifier:cell_Id];
    _favoriteCollectionView.delegate = self;
    _favoriteCollectionView.dataSource = self;
    _favoriteCollectionView.backgroundColor = [UIColor cornColor];
    [self addSubview:_favoriteCollectionView];
    // 上拉下拉刷新加载
    _favoriteCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    _favoriteCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
    
}

- (void)_loadNewData {
    [DataService requestUrl:HOTURL httpMethod:@"GET" params:nil block:^(id result) {
        //        NSLog(@"%@",result);
    }];
    
}

- (void)_loadMoreData {
    //    next_url = http://api.liwushuo.com/v1/item_channels/1/items?limit=10&offset=20   http://api.liwushuo.com/v1/item_channels/1/items?
    
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSInteger offset = 50;
    NSString *offsetStr = [NSString stringWithFormat:@"%ld",(long)offset];
    [params setObject:@"10" forKey:@"limit"];
    [params setObject:offsetStr forKey:@"offset"];
    
    if (_favoriteArray.count != 0) {
        [DataService requestUrl:@"http://api.liwushuo.com/v1/item_channels/1/items?" httpMethod:@"GET" params:params block:^(id result) {
            NSLog(@"%@",result);
            NSArray *nextArray = [[result objectForKey:@"data"] objectForKey:@"items"];
            for (NSDictionary *dic in nextArray) {
                FavoriteModel *favoriteModel = [[FavoriteModel alloc] init];
                favoriteModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
                favoriteModel.descriptions = [dic objectForKey:@"description"];
                favoriteModel.name = [dic objectForKey:@"name"];
                favoriteModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
                favoriteModel.price = [dic objectForKey:@"price"];
                favoriteModel.image_urls = [dic objectForKey:@"image_urls"];
                favoriteModel.url = [dic objectForKey:@"url"];
                favoriteModel.purchase_url = [dic objectForKey:@"purchase_url"];
                favoriteModel.editor_id = [[dic objectForKey:@"editor_id"] integerValue];
                favoriteModel.identity = [[dic objectForKey:@"id"] integerValue];

                //把modal放到数组里面
                [_favoriteArray addObject:favoriteModel];
            }
            [_favoriteCollectionView reloadData];
            NSLog(@"%@",_favoriteArray);
        }];
        NSLog(@"%li",(long)offset);
        
    }
    //    if (offset!=0) {
    
    //        offset+=10;
    //    }
    
    //        while (offset != 0) {
    //        [DataService requestUrl:@"http://api.liwushuo.com/v1/item_channels/1/items?" httpMethod:@"GET" params:params block:^(id result) {
    //            NSLog(@"%@",result);
    //        }];
    //        offset+=10;
    //    }
    
    
    //    [params setObject:@"10" forKey:@"limit"];
    //    [params setObject:@"20" forKey:@"offset"];
    //    [DataService requestUrl:@"http://api.liwushuo.com/v1/item_channels/1/items?" httpMethod:@"GET" params:params block:^(id result) {
    ////        NSLog(@"%@",result);
    //
    //    }];
    //    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    //    [params setObject:@"10" forKey:@"count"];
    //
    //    if (_data.count != 0) {       //
    //        WeiboViewLaoutFrame *layoutFrame = [_data lastObject];
    //        WeiboModel *model = layoutFrame.weiboModel;
    //
    //        NSString *maxId =  model.weiboId.stringValue;
    //        [params setObject:maxId forKey:@"max_id"];
    //    }
    //
    //    //获取微博
    //    SinaWeiboRequest *request =  [sinaweibo requestWithURL:home_timeline
    //                                                    params:[params mutableCopy]
    //                                                httpMethod:@"GET"
    //                                                  delegate:self];
    //
    //    request.tag = 102;
    
    //    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    //    params
    
    
}


- (void)_loadData {
    [DataService requestUrl:HOTURL httpMethod:@"GET" params:nil block:^(id result) {
        //        NSLog(@"%@",result);
        _favoriteDic = [result objectForKey:@"data"];
        //        NSLog(@"%@",_favoriteDic);
        NSDictionary *pagingDic = [_favoriteDic objectForKey:@"paging"];
        NSString *pagingStr = [pagingDic objectForKey:@"next_url"];
        _pagingStr = pagingStr;
        //        NSLog(@"%@",_pagingStr);
        NSArray *itemsArray = [self.favoriteDic objectForKey:@"items"];
        for (NSDictionary *dic in itemsArray) {
            FavoriteModel *favoriteModel = [[FavoriteModel alloc] init];
            favoriteModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            favoriteModel.descriptions = [dic objectForKey:@"description"];
            favoriteModel.name = [dic objectForKey:@"name"];
            favoriteModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
            favoriteModel.price = [dic objectForKey:@"price"];
            favoriteModel.image_urls = [dic objectForKey:@"image_urls"];
            favoriteModel.url = [dic objectForKey:@"url"];
            favoriteModel.purchase_url = [dic objectForKey:@"purchase_url"];
            favoriteModel.editor_id = [[dic objectForKey:@"editor_id"] integerValue];
            favoriteModel.identity = [[dic objectForKey:@"id"] integerValue];

            //把modal放到数组里面
            [_favoriteArray addObject:favoriteModel];
        }
        [_favoriteCollectionView reloadData];
    }];
}


#pragma mark - CollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _favoriteArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FavoriteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_Id forIndexPath:indexPath];
    cell.favoriteModel = _favoriteArray[indexPath.row];
    cell.backgroundColor = [UIColor whiteSmoke];
    //    NSLog(@"%@", NSStringFromCGRect(cell.coverImgView.bounds));
    NSLog(@"%ld",(long)cell.favoriteModel.editor_id);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    FavoriteModel *favoriteModel = _favoriteArray[indexPath.row];
    FavoriteDetailViewController *vc = [[FavoriteDetailViewController alloc] init];
    vc.favoriteModel = favoriteModel;
    
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            //沿着响应者链可以找到vc
            UIViewController *vc = (UIViewController *)next;
            [vc.navigationController pushViewController:vc animated:NO];
            return;
        }
        next = next.nextResponder;
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
