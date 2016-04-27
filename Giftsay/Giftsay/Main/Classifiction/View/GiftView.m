//
//  GiftView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/17.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "GiftView.h"

@implementation GiftView

//http://www.liwushuo.com/posts?tab=occasion&scene_id=35 乔迁
//http://www.liwushuo.com/posts?tab=occasion&scene_id=32  情人节
//http://www.liwushuo.com/posts?tab=occasion&scene_id=36  感谢
//http://www.liwushuo.com/posts?tab=occasion&scene_id=33  结婚
//http://www.liwushuo.com/posts?tab=occasion&scene_id=31 纪念日
//http://www.liwushuo.com/posts?tab=occasion&scene_id=30 生日
//http://www.liwushuo.com/posts?tab=occasion&scene_id=39 新年

//http://api.liwushuo.com/v2/items/%@

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {        
        [self _loadData];
    }
    return self;
}


- (void)_loadData {
    [DataService requestUrl:@"http://api.liwushuo.com/posts?tab=occasion&scene_id=35" httpMethod:@"POST" params:nil block:^(id result) {
        NSLog(@"%@",result);
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
