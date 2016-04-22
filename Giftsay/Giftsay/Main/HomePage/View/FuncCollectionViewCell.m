//
//  FuncCollectionViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncCollectionViewCell.h"
#import "FuncTableViewCell.h"
#import "BaseCollectionViewCell.h"
#import "HeaderModel.h"
#import "SpecialDetailModel.h"
static NSString *funcTableCellId = @"funcTableCellId";
static NSString *collectionCellId = @"collectionCellId";

@implementation FuncCollectionViewCell
{
    NSMutableArray *_array;
    NSMutableArray *_specialMutableArray;
}


- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _array = [[NSMutableArray alloc] init];
        _specialMutableArray = [[NSMutableArray alloc] init];
        [self _loadData];
        [self _createSubviews];
    }
    return self;
}

//- (void)_loadDada {
//    [DataService requestUrl:BANNERURL httpMethod:@"GET" params:nil block:^(id result) {
// 
//    }];
//}


- (void)setChannelsModel:(ChannelsModel *)channelsModel {
    if (_channelsModel != channelsModel) {
        _channelsModel = channelsModel;
    }
}

- (void)_createSubviews {
    // 创建tableview视图
    _funcTableView = [[FuncTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight-kHeight*0.07-64-49) style:UITableViewStylePlain];
    [self.contentView addSubview:_funcTableView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kWidth, kHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) collectionViewLayout:layout];
    [_collectionView registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:collectionCellId];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor greenColor];
    _collectionView.hidden = YES;
    if (self.tag == 0) {        
        _collectionView.hidden = YES;
    } else {
        _collectionView.hidden = NO;
    }
}

- (void)_loadData {
    // 分类个类的详情 “http://api.liwushuo.com/v1/channels/id/items?channels=104&limit=10&offset=0”
    //#define CHANNELDETAILURL @"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=20&offset=%@"
    //    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=%@&offset=%@",[NSNumber numberWithInteger:_channelModel.identity],[NSNumber numberWithInteger:_channelModel.items_count],@0];

    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=10&offset=%@",[NSNumber numberWithInteger:_channelsModel.identity],@0];

    //    @property (nonatomic,copy) NSString *title;
    //    @property (nonatomic,copy) NSString *url;
    //    @property (nonatomic,copy) NSString *share_msg;
    //    @property (nonatomic,assign) NSInteger likes_count;

    [DataService requestUrl:url httpMethod:@"GET" params:nil block:^(id result) {
//        NSLog(@"%@",result);
        NSArray *postsArray = [[result objectForKey:@"data"] objectForKey:@"items"];
        for (NSDictionary *dic in postsArray) {
//            SpecialDetailModel *specialDetailModel = [[SpecialDetailModel alloc] init];
//            specialDetailModel.title = [dic objectForKey:@"title"];
//            specialDetailModel.url = [dic objectForKey:@"url"];
//            specialDetailModel.share_msg = [dic objectForKey:@"share_msg"];
//            specialDetailModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
//            specialDetailModel.content_url = [dic objectForKey:@"content_url"];
//            specialDetailModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            BaseModel *specialDetailModel = [[BaseModel alloc] init];
            specialDetailModel.title = [dic objectForKey:@"title"];
            specialDetailModel.url = [dic objectForKey:@"url"];
            specialDetailModel.share_msg = [dic objectForKey:@"share_msg"];
            specialDetailModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
            specialDetailModel.content_url = [dic objectForKey:@"content_url"];
            specialDetailModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            [_specialMutableArray addObject:specialDetailModel];
        }
        [_collectionView reloadData];
    }];
}


#pragma mark - CollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"%li",self.channelsModel.items_count);
    return self.channelsModel.items_count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor realgarColor];
    cell.baseModel = _specialMutableArray[indexPath.row];
    return cell;
}







@end
