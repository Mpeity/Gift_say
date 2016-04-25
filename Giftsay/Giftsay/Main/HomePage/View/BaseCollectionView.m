//
//  BaseCollectionView.m
//  Giftsay
//
//  Created by nick_beibei on 16/4/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "BaseCollectionView.h"
#import "BaseCollectionViewCell.h"
#import "BaseWebViewController.h"

static NSString *collectionCellId = @"collectionCellId";


@implementation BaseCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        [self _createSubviews];
    }
    return self;
}


- (void)_createSubviews {
    UINib *nib = [UINib nibWithNibName:@"BaseCollectionViewCell" bundle:nil];
    [self registerNib:nib forCellWithReuseIdentifier:collectionCellId];
    self.dataSource = self;
    self.delegate = self;
}

- (void)setAllArray:(NSMutableArray *)allArray {
    if (_allArray != allArray) {
        _allArray = allArray;
    }
}


#pragma mark - CollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _allArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor realgarColor];
    cell.baseModel = self.allArray[indexPath.row];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseWebViewController *baseWebVC = [[BaseWebViewController alloc] init];
    baseWebVC.baseModel = _allArray[indexPath.row];
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            //沿着响应者链可以找到vc
            UIViewController *vc = (UIViewController *)next;
            [vc presentViewController:baseWebVC animated:NO completion:nil];
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
