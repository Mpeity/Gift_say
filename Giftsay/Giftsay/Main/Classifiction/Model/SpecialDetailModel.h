//
//  SpecialDetailModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/23.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

//{
//    message = OK,
//    data = {
//        cover_image_url = http://img02.liwushuo.com/image/160317/3af7hpan1.jpg-w720,
//        id = 227,
//        posts_count = 5,
//        banner_webp_url = http://img03.liwushuo.com/image/160317/1waks9fpe.jpg?imageView2/0/w/300/q/85/format/webp,
//        subtitle = 让男神心动的早春穿搭,
//        banner_image_url = http://img03.liwushuo.com/image/160317/1waks9fpe.jpg-w300,
//        cover_webp_url = http://img02.liwushuo.com/image/160317/3af7hpan1.jpg?imageView2/0/w/720/q/85/format/webp,
//        created_at = 1458185256,
//        posts = [
//        {
//            liked = 0,
//            status = 0,
//            title =  一条牛仔裤，解决你的上班穿衣全look,
//            editor_id = 1021,
//            url = http://www.liwushuo.com/posts/1038122,
//            ad_monitors = [
//            ],
//            published_at = 1458028800,
//            updated_at = 1457613928,
//            template = ,
//            feature_list = [
//                            1,
//                            5,
//                            6,
//                            9
//                            ],
//            label_ids = [
//            ],
//            id = 1038122,
//            content_type = 2,
//            content_url = http://www.liwushuo.com/posts/1038122/content,
//            share_msg = 今天穿什么？！每天早上起来都要问自己一遍。简直比“今天吃什么”还烦！你要学会为造型做减法，在繁忙的工作之余一定要让搭配变得尽可能轻松畅快，造型自带主角光环的秘诀就是：简单而用心，不给自己添堵。其方法就是：一条裤装，轻松搞定。,
//            likes_count = 19940,
//            created_at = 1458028800,
//            short_title = ,
//            cover_webp_url = http://img01.liwushuo.com/image/160310/gr0m0wf2w.jpg?imageView2/0/w/720/q/85/format/webp,
//            cover_image_url = http://img01.liwushuo.com/image/160310/gr0m0wf2w.jpg-w720
//        },
//                 ],
//        url = http://www.liwushuo.com/collections/227,
//        title = 早春穿搭指南,
//        updated_at = 1458185256,
//        paging = {
//            next_url = http://api.liwushuo.com/v1/collections/227/posts?limit=5&channel=104&offset=5
//        },
//        status = 0
//    },
//    code = 200
//    }


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



@interface SpecialDetailModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *share_msg;
@property (nonatomic,assign) NSInteger likes_count;
@property (nonatomic,copy) NSString *content_url;
@property (nonatomic,copy) NSString *cover_image_url;


@end
