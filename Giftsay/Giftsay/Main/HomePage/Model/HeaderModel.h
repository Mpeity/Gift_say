//
//  HeaderModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "BaseModel.h"

//{
//    message = OK,
//    data = {
//        banners = [
//        {
//            id = 563,
//            ad_monitors = [
//            ],
//            channel = all,
//            webp_url = http://img03.liwushuo.com/image/160406/bn9oroayk.jpg?imageView2/0/w/720/q/85/format/webp,
//            image_url = http://img03.liwushuo.com/image/160406/bn9oroayk.jpg-w720,
//            type = collection,
//            order = 231,
//            target_id = 229,
//            target = {
//                cover_image_url = http://img02.liwushuo.com/image/160406/84b9ux50a.jpg-w720,
//                id = 229,
//                posts_count = 4,
//                banner_webp_url = http://img03.liwushuo.com/image/160406/m79xfkche.jpg?imageView2/0/w/300/q/85/format/webp,
//                subtitle = 笔尖流淌的小确幸，不老的文艺心,
//                banner_image_url = http://img03.liwushuo.com/image/160406/m79xfkche.jpg-w300,
//                cover_webp_url = http://img02.liwushuo.com/image/160406/84b9ux50a.jpg?imageView2/0/w/720/q/85/format/webp,
//                created_at = 1459923150,
//                title = 文艺范钢笔,
//                updated_at = 1459923150,
//                status = 0
//            },
//            target_type = url,
//            status = 0,
//            target_url = liwushuo:///page?page_action=navigation&type=topic&topic_id=229
//        }
//                   ]
//    },
//    code = 200
//    }




@interface HeaderModel : BaseModel

//@property (nonatomic,copy) NSString *title;
//@property (nonatomic,copy) NSString *url;
//@property (nonatomic,copy) NSString *share_msg;
//@property (nonatomic,assign) NSInteger likes_count;
//@property (nonatomic,copy) NSString *content_url;
//@property (nonatomic,copy) NSString *cover_image_url;

@property (nonatomic,copy) NSString *image_url;
@property (nonatomic,assign) NSInteger order;
@property (nonatomic,assign) NSInteger target_id;

@property (nonatomic,strong) NSMutableDictionary *targetDic;



@end
