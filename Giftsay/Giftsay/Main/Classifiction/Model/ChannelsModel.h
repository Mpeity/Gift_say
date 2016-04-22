//
//  ChannelsModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/21.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

//{
//    status = 0,
//    id = 1,
//    channels = [
//    {
//        status = 0,
//        group_id = 1,
//        id = 125,
//        items_count = 85,
//        order = 5,
//        icon_url = http://img03.liwushuo.com/image/150618/6plyrz2qq.png-pw144,
//        name = 创意生活
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 11,
//        items_count = 162,
//        order = 4,
//        icon_url = http://img02.liwushuo.com/image/141016/ka5jhbrxz.png-pw144,
//        name = 萌萌哒
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 14,
//        items_count = 290,
//        order = 3,
//        icon_url = http://img02.liwushuo.com/image/141016/v8i6mjebe.png-pw144,
//        name = 小清新
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 28,
//        items_count = 81,
//        order = 3,
//        icon_url = http://img03.liwushuo.com/image/141205/9h183f7k8.png-pw144,
//        name = 科技范
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 126,
//        items_count = 21,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/150618/5achk94ie.png-pw144,
//        name = 奇葩搞怪
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 127,
//        items_count = 80,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/150618/h0fczbucb.png-pw144,
//        name = 设计感
//    }
//                ],
//    order = 2,
//    name = 风格
//}

@interface ChannelsModel : NSObject <NSCoding>

@property (nonatomic,assign) NSInteger group_id;
@property (nonatomic,assign) NSInteger identity;
@property (nonatomic,copy) NSString *icon_url;
@property (nonatomic,copy) NSString *icon_name;
@property (nonatomic,assign) NSInteger items_count;



@end
