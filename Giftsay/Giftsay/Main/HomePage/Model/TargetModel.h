//
//  TargetModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface TargetModel : NSObject

@property (nonatomic,copy) NSString *cover_image_url;
@property (nonatomic,assign) NSInteger identity; //
@property (nonatomic,assign) NSInteger posts_count;
@property (nonatomic,copy) NSString *banner_webp_url;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *cover_webp_url;
@property (nonatomic,copy) NSString *title;


@end
