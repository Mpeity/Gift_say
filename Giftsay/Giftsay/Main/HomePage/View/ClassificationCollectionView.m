//
//  ClassificationCollectionView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "ClassificationCollectionView.h"
#import "ChannelsModel.h"

static NSString *cellID = @"cellID";

@implementation ClassificationCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        self.backgroundColor = [UIColor  waterPink];
        self.delegate = self;
        self.dataSource = self;
        bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.height-3, 40, 2)];
        bgImgView.image = [UIImage imageNamed:@"bg_datepicker.9"];
        [self addSubview:bgImgView];
    }
    return self;
}

- (void)setAllArray:(NSMutableArray *)allArray {
    if (_allArray != allArray) {
        _allArray = allArray;
    }
}

//- (void)setItemWidth:(CGFloat)itemWidth {
//    if (_itemWidth != itemWidth) {
//        _itemWidth = itemWidth;
//    }
//}


#pragma mark - collectionView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView  dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    ChannelsModel *channelsModel = _allArray[indexPath.row];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    [cell.contentView addSubview:label];
    label.text = channelsModel.icon_name;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //targetContentOffset 目标偏移量
    //targetContentOffset->x
    
    //调整 目标偏移
    CGFloat itemWith = self.itemWidth;
    CGFloat x = targetContentOffset->x;
    NSInteger index = x/itemWith;// 5    x= 6      index  1
    //安全处理
    if (index < 0) {
        index = 0;
    } else if (index>= _allArray.count){
        index = _allArray.count-1;
    }
    targetContentOffset->x = itemWith * index;  // 0
    self.currentIndex = index;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    CGFloat x = (50*(indexPath.row+1))/2+40/2;
    bgImgView.center = CGPointMake(x, self.height-3);
    [UIView commitAnimations];
    if (indexPath.row != self.currentIndex) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
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
