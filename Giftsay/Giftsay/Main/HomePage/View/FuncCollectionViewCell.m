//
//  FuncCollectionViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncCollectionViewCell.h"

@implementation FuncCollectionViewCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)_createSubviews {
    // 创建tableview视图
    _funcTableView = [[FuncTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _funcTableView.delegate = self;
    _funcTableView.dataSource = self;
    [self.contentView addSubview:_funcTableView];
    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, kWidth, _funcTableView.height*0.5)];
    [_funcTableView addSubview:_headerView];
}




#pragma mark - TableViewDelegate



@end
