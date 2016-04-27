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

@implementation FuncCollectionViewCell
{
    NSMutableArray *_specialMutableArray;
}


- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)setChannelsModel:(ChannelsModel *)channelsModel {
    if (_channelsModel != channelsModel) {
        _channelsModel = channelsModel;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    // 创建tableview视图

    [super layoutSubviews];
    _funcTableView = [[FuncTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight-kHeight*0.07-64-49) style:UITableViewStylePlain];
    [self.contentView addSubview:_funcTableView];
    _funcTableView.backgroundColor = [UIColor whiteSmoke];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kWidth-20 ,(kWidth-20)*13/28);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[BaseCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight-(kWidth-20)*13/28) collectionViewLayout:layout];
    [self.contentView addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.hidden = YES;
    if (self.tag == 0) {
        _funcTableView.hidden = NO;
        _collectionView.hidden = YES;
        [_collectionView removeFromSuperview];
    } else {
        [self.contentView addSubview:_collectionView];
        _collectionView.hidden = NO;
        _funcTableView.hidden = YES;
        [self _loadData];
    }
}


- (void)_loadData {
    // 分类个类的详情 “http://api.liwushuo.com/v1/channels/id/items?channels=104&limit=10&offset=0”
    //#define CHANNELDETAILURL @"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=20&offset=%@"
    //    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=%@&offset=%@",[NSNumber numberWithInteger:_channelModel.identity],[NSNumber numberWithInteger:_channelModel.items_count],@0];
    _specialMutableArray = [[NSMutableArray alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=50&offset=%@",[NSNumber numberWithInteger:self.channelsModel.identity],@0];
    [DataService requestUrl:url httpMethod:@"GET" params:nil block:^(id result) {
        NSArray *postsArray = [[result objectForKey:@"data"] objectForKey:@"items"];
        for (NSDictionary *dic in postsArray) {
            BaseModel *specialDetailModel = [[BaseModel alloc] init];
            specialDetailModel.title = [dic objectForKey:@"title"];
            specialDetailModel.url = [dic objectForKey:@"url"];
            specialDetailModel.share_msg = [dic objectForKey:@"share_msg"];
            specialDetailModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
            specialDetailModel.content_url = [dic objectForKey:@"content_url"];
            specialDetailModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            [_specialMutableArray addObject:specialDetailModel];
            _collectionView.allArray = _specialMutableArray;
        }
        [_collectionView reloadData];
    }];    
}








@end
