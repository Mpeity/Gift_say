//
//  NextModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

//{
//    message = OK,
//    data = {
//        promotions = [
//        {
//            status = 0,
//            color = #81c52b,
//            id = 1,
//            order = <null>,
//            title = 美好小物,
//            target_url = liwushuo:///page?type=topic&topic_id=22&page_action=navigation&title=%e6%af%8f%e6%97%a5%e5%8d%81%e4%bb%b6%e7%be%8e%e5%a5%bd%e5%b0%8f%e7%89%a9,
//            icon_url = http://img03.liwushuo.com/image/150310/62ggu1j0m.png-pw144
//        },
//        {
//            status = 0,
//            color = #fc716f,
//            id = 2,
//            order = <null>,
//            title = 攻略专题,
//            target_url = liwushuo:///page?type=topic_all,
//            icon_url = http://img01.liwushuo.com/image/150319/8edxk0je6.png-pw144
//        },
//        {
//            status = 0,
//            color = #8686ff,
//            id = 3,
//            order = <null>,
//            title = 每日签到,
//            target_url = liwushuo:///page?type=url&url=http%3a%2f%2fwww.liwushuo.com%2fcredit%2fsign&login=true&right_item_title=,
//            icon_url = http://img02.liwushuo.com/image/150310/f3hvat0ac.png-pw144
//        },
//        {
//            status = 0,
//            color = #fd6f9e,
//            id = 4,
//            order = <null>,
//            title = 天天刮奖,
//            target_url = ,
//            icon_url = http://img03.liwushuo.com/image/150310/2q080j10l.png-pw144
//        }
//                      ]
//    },
//    code = 200
//    }

@interface NextModel : NSObject

@property (nonatomic,copy) NSString *icon_url;
@property (nonatomic,copy) NSString *target_url;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) NSInteger identy;

@end
