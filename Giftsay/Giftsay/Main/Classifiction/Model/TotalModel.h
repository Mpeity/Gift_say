//
//  TotalModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/22.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

//{
//    message = OK,
//    data = {
//        collections = [
//        {
//            cover_image_url = http://img03.liwushuo.com/image/160317/3af7hpan1.jpg-w720,
//            id = 227,
//            posts_count = 5,
//            banner_webp_url = http://img03.liwushuo.com/image/160317/1waks9fpe.jpg?imageView2/0/w/300/q/85/format/webp,
//            subtitle = 让男神心动的早春穿搭,
//            banner_image_url = http://img03.liwushuo.com/image/160317/1waks9fpe.jpg-w300,
//            cover_webp_url = http://img03.liwushuo.com/image/160317/3af7hpan1.jpg?imageView2/0/w/720/q/85/format/webp,
//            created_at = 1458185256,
//            title = 早春穿搭指南,
//            updated_at = 1458185256,
//            status = 0
//        },
//        {
//            cover_image_url = http://img01.liwushuo.com/image/160205/2uy4u0ofj.jpg-w720,
//            id = 219,
//            posts_count = 5,
//            banner_webp_url = http://img02.liwushuo.com/image/160205/vqcg1mkn4.jpg?imageView2/0/w/300/q/85/format/webp,
//            subtitle =   聚会出游照着穿，变身男神收割机！,
//            banner_image_url = http://img02.liwushuo.com/image/160205/vqcg1mkn4.jpg-w300,
//            cover_webp_url = http://img01.liwushuo.com/image/160205/2uy4u0ofj.jpg?imageView2/0/w/720/q/85/format/webp,
//            created_at = 1454810054,
//            title = 假期穿搭手册,
//            updated_at = 1454637226,
//            status = 0
//        }
//                       ],
//        paging = {
//            next_url = http://api.liwushuo.com/v1/collections?limit=10&channel=104&offset=10
//        }
//    },
//    code = 200
//    }

@interface TotalModel : NSObject

@property (nonatomic,copy) NSString *cover_image_url;
@property (nonatomic,copy) NSString *banner_image_url;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *next_url;
@property (nonatomic,assign) NSInteger identity;
@property (nonatomic,assign) NSInteger posts_count;
@property (nonatomic,assign) NSInteger status;



@end
