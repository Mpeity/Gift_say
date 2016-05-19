//
//  BaseModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

// 各类Model
//{
//    labels = [
//    ],
//    liked = 0,
//    status = 0,
//    title = 脖子短星人，也可以任性穿高领,
//    editor_id = 1045,
//    url = http://www.liwushuo.com/posts/1023496,
//    ad_monitors = [
//    ],
//    published_at = 1448848800,
//    updated_at = 1448260919,
//    template = ,
//    feature_list = [
//    ],
//    type = post,
//    id = 1023496,
//    content_type = 1,
//    content_url = http://www.liwushuo.com/posts/1023496/content,
//    share_msg = 没有大长腿，还被嘲笑脖子短，作为各种&ldquo;长&rdquo;的绝缘体，妹纸们，擦干眼泪，我们可以自行加长啊。不过话说回来，大冬天的总不能一直穿深V，在面对高领毛衣、大围巾这种保暖值满分，又让脖子秒消失的穿着问题，我们必须严肃的处理下。,
//    likes_count = 29057,
//    created_at = 1458777600,
//    short_title = 高领,
//    cover_webp_url = http://img01.liwushuo.com/image/151123/6k6706cvb.jpg?imageView2/0/w/720/q/85/format/webp,
//    cover_image_url = http://img01.liwushuo.com/image/151123/6k6706cvb.jpg-w720
//    },

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *share_msg;
@property (nonatomic,assign) NSInteger likes_count;
@property (nonatomic,copy) NSString *content_url;
@property (nonatomic,copy) NSString *cover_image_url;
@property (nonatomic,assign) NSInteger identity; //



@end
