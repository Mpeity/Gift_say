//
//  ClassificationCollectionView.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassificationCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) NSMutableDictionary *classificationDic;




@end
