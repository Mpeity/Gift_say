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

static NSString *funcTableCellId = @"funcTableCellId";
static NSString *collectionCellId = @"collectionCellId";

@implementation FuncCollectionViewCell
{
    NSMutableArray *_array;
}


- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _array = [[NSMutableArray alloc] init];
        [self _loadDada];

        [self _createSubviews];

    }
    return self;
}

- (void)_loadDada {
    [DataService requestUrl:BANNERURL httpMethod:@"GET" params:nil block:^(id result) {
        //        NSLog(@"%@",result);
        NSArray *bannersArray = [[result objectForKey:@"data"] objectForKey:@"banners"];
        for (NSDictionary *dic in bannersArray) {
            HeaderModel *headerModel = [[HeaderModel alloc] init];
            headerModel.image_url = [dic objectForKey:@"image_url"];
            [_array addObject:headerModel];
            _funcTableView.array = _array;

            //                                NSLog(@"%@",result);
        }
        [_funcTableView reloadData];
    }];
}


- (void)_createSubviews {
    // 创建tableview视图
//    _funcTableView = [[FuncTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _funcTableView = [[FuncTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStyleGrouped];
    _funcTableView.delegate = self;
    _funcTableView.dataSource = self;
    [self.contentView addSubview:_funcTableView];
//    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, -200, kWidth, _funcTableView.height*0.5)];
    [_funcTableView registerClass:[FuncTableViewCell class] forCellReuseIdentifier:funcTableCellId];
//    _headerView.backgroundColor = [UIColor forestGreen];
//    _funcTableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
//    [_funcTableView addSubview:_headerView];

    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kWidth, 200);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) collectionViewLayout:layout];
    [_collectionView registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:collectionCellId];
    [self addSubview:_collectionView];
    _collectionView.hidden = YES;
}


#pragma mark - TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FuncTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:funcTableCellId];
    return cell;
}

#pragma mark - CollectionViewDelegate


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    return cell;
}







@end
