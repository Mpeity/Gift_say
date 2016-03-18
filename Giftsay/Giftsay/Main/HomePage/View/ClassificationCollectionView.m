//
//  ClassificationCollectionView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "ClassificationCollectionView.h"

static NSString *cellID = @"cellID";


@implementation ClassificationCollectionView
{
    NSArray *_textArray; //

}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        
    }
    return self;
}




#pragma mark - collectionView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _textArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView  dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    [cell.contentView addSubview:label];
    label.text = _textArray[indexPath.row];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    return cell;
}




























/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
