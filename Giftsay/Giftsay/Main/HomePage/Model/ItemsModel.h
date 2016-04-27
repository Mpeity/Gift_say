//
//  ItemsModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

//{
//    message = OK,
//    data = {
//        items = [
//        {
//            labels = [
//            ],
//            liked = 0,
//            status = 0,
//            title = 送闺蜜去脂肪粒神器，还她健康眼周肌！,
//            editor_id = 1058,
//            url = http://www.liwushuo.com/posts/1039282,
//            ad_monitors = [
//            ],
//            published_at = 1461052800,
//            updated_at = 1458298809,
//            template = ,
//            feature_list = [
//                            9,
//                            6
//                            ],
//            type = post,
//            id = 1039282,
//            content_type = 2,
//            content_url = http://www.liwushuo.com/posts/1039282/content,
//            share_msg = 随着环境的恶化，小伙伴们对脸部的护理更加重视了，尤其是眼部。都说人老眼先老，小伙伴们尤其注意眼部的保养，这虽然没有错，但是！请注意，这里要有但是了！好好地保养不是一个劲儿地往脸上擦东西，而是要选中适合自己的。爱有脂肪粒的小伙伴们，一定要选择清爽湿润无负担的眼霜。但是已经有脂肪粒的小伙伴们也不要怕，脂肪粒也没有那么可怕，用对产品加按摩，它很快就会消失哒~,
//            likes_count = 6642,
//            created_at = 1461052800,
//            short_title = 祛脂肪粒,
//            cover_webp_url = http://img01.liwushuo.com/image/160318/0w8bdor7t.jpg?imageView2/0/w/720/q/85/format/webp,
//            cover_image_url = http://img01.liwushuo.com/image/160318/0w8bdor7t.jpg-w720
//        },
//
//    code = 200
//    }

@interface ItemsModel : NSObject

@property (nonatomic,copy) NSString *editor_id;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *content_url;
@property (nonatomic,copy) NSString *share_msg;
@property (nonatomic,assign) NSInteger likes_count;
@property (nonatomic,copy) NSString *cover_webp_url;
@property (nonatomic,copy) NSString *cover_image_url;
@property (nonatomic,assign) NSInteger identity;

@end
