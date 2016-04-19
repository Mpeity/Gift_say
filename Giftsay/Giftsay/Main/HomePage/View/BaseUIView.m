//
//  BaseUIView.m
//  Giftsay
//
//  Created by nick_beibei on 16/4/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "BaseUIView.h"
#import "FuncCollectionViewCell.h"
static NSString *funcCellId = @"funcCellId";

@implementation BaseUIView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _createSubViews];
        
    }
    return self;
}


- (void)_createSubViews {
    // 创建每个CollectionView视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc ]init];
    layout.itemSize = CGSizeMake(kWidth, kHeight-kHeight*0.07);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _funcCollectionView = [[FuncCollectionView alloc] initWithFrame:CGRectMake(0, kHeight*0.07, kWidth, kHeight*0.93) collectionViewLayout:layout];
    [self addSubview:_funcCollectionView];
//    _funcCollectionView.delegate = self;
//    _funcCollectionView.dataSource = self;
//    [_funcCollectionView registerClass:[FuncCollectionViewCell class] forCellWithReuseIdentifier:funcCellId];
//    _funcCollectionView.backgroundColor = [UIColor navyColor];
}

//#pragma mark - collectionViewDlegate
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 10;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    FuncCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:funcCellId forIndexPath:indexPath];
//    return cell;
//}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
