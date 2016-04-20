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
//            color = #fd6f9e,
//            id = 4,
//            order = <null>,
//            title = 天天刮奖,
//            target_url = ,
//            icon_url = http://img02.liwushuo.com/image/150310/2q080j10l.png-pw144
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
