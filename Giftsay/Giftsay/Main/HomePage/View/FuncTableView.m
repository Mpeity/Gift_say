//
//  FuncTableView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncTableView.h"

@implementation FuncTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
//        [self _createSubviews];
    }
    return self;
}


- (void)_createSubviews {
    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, -200, kWidth, self.height*0.5)];
    self.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    _headerView.headerArray = self.array;
    [self addSubview:_headerView];
}

- (void)setArray:(NSMutableArray *)array {
    if (_array != array) {
        
        _array = array;
    }
}



@end
