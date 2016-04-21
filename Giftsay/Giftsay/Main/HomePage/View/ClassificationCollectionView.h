//
//  ClassificationCollectionView.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassificationCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIImageView *bgImgView; //
}


@property (nonatomic,strong) NSMutableDictionary *classificationDic;

@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSMutableArray *allArray;
@property (nonatomic,assign)CGFloat itemWidth;


@end
