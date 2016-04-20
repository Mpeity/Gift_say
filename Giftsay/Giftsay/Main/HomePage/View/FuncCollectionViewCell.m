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
 
    }];
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
    [self addSubview:_collectionView];
    _collectionView.hidden = YES;
    if (self.tag == 0) {        
        _collectionView.hidden = YES;
    } else {
        _collectionView.hidden = NO;
    }
}


//#pragma mark - TableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 5;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    FuncTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:funcTableCellId];
//    return cell;
//}

#pragma mark - CollectionViewDelegate


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    return cell;
}







@end
