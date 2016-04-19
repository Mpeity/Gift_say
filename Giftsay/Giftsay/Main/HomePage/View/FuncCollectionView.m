//
//  FuncCollectionView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/14.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncCollectionView.h"
#import "FuncCollectionViewCell.h"


static NSString *cellId = @"cellId";
@implementation FuncCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self _createSubviews];
    }
    return self;
}


- (void)_createSubviews {
    [self registerClass:[FuncCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    self.delegate = self;
    self.dataSource = self;    
}






#pragma mark - Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FuncCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (cell.tag == 0) {
        cell.funcTableView.hidden = NO;
        cell.headerView.hidden = NO;


    } else {
        [cell.funcTableView removeFromSuperview];
        [cell.headerView removeFromSuperview];        
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
