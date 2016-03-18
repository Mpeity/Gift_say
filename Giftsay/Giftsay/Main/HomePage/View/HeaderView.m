//
//  HeaderView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self _createSubviews];
        _headerDic = [[NSMutableDictionary alloc] init];
        [self _loadDada];
    }
    return self;
}


#pragma mark - 创建tableView的头部视图
- (void)_createSubviews {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height*0.6)];
    _scrollView.contentSize = CGSizeMake(self.width*4, self.height*0.6);
    _scrollView.contentOffset = CGPointMake(0, 0); // 设置滚动的偏移量
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
}


// 获取数据 并解析
- (void)_loadDada {
    [DataService requestUrl:BANNERURL httpMethod:@"GET" params:nil block:^(id result) {
        NSLog(@"%@",result);
        result = _headerDic;
    }];
}




#pragma mark - scrollViewDelegate



#pragma mark - collectionViewDelegate















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
