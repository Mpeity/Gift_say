//
//  StrateTableViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/17.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "StrateTableViewCell.h"
#import "CommonCollectionViewCell.h"
#import "IconViewController.h"
@implementation StrateTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.width, self.height-20)];
    [self.contentView addSubview:_cellView];
    _cellView.backgroundColor = [UIColor whiteColor];
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width, 30)];
//    _headerLabel.textAlignment = NSTextAlignmentLeft;
    _headerLabel.text = self.commonModel.name;
    _headerLabel.backgroundColor = [UIColor whiteColor];
    [_cellView addSubview:_headerLabel];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat cellWidth = (_cellView.width-50)/4;
    CGFloat cellHeight = cellWidth+25;
    layout.itemSize = CGSizeMake(cellWidth, cellHeight);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _headerLabel.height, self.width, self.height-_headerLabel.height) collectionViewLayout:layout];
    UINib *nib = [UINib nibWithNibName:@"CommonCollectionViewCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.scrollEnabled = NO;
    [_cellView addSubview:_collectionView];
}

- (void)setCommonModel:(CommonModel *)commonModel {
    if (_commonModel != commonModel) {
        _commonModel = commonModel;
    }
    [self setNeedsLayout];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.commonModel.groupArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CommonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.channelModel = self.commonModel.groupArray[indexPath.row];
//    NSLog(@"%f",collectionView.height);
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ChannelsModel *channelsModel = self.commonModel.groupArray[indexPath.row];
    IconViewController *iconVC = [[IconViewController alloc] init];
    iconVC.channelModel = channelsModel;
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            //沿着响应者链可以找到vc
            UIViewController *vc = (UIViewController *)next;
            [vc.navigationController pushViewController:iconVC animated:NO];
            return;
        }
        next = next.nextResponder;
    }
}



@end
