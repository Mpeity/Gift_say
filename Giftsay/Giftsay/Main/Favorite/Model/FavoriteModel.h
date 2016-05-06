//
//  FavoriteModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 {
 "brand_id" = "<null>";
 "brand_order" = "<null>";
 "category_id" = 5;
 "cover_image_url" = "http://img02.liwushuo.com/image/150720/1z4oi07aw.jpg-w720";
 "cover_webp_url" = "http://img02.liwushuo.com/image/150720/1z4oi07aw.jpg?imageView2/0/w/720/q/85/format/webp";
 "created_at" = 1437374652;
 description = "\U4eab\U53d7\U4e00\U676f\U73b0\U78e8\U5496\U5561\Uff0c\U4ec5\U970060\U79d2\Uff0c\U6d53\U800c\U4e0d\U82e6\Uff0c\U9999\U800c\U4e0d\U70c8\Uff0c\U4e14\U5e26\U6709\U6de1\U6de1\U7684\U575a\U679c\U5473~\U7279\U522b\U9002\U5408\U4e8e\U5c45\U5bb6\U3001\U529e\U516c\U3001\U805a\U4f1a\U548c\U65c5\U884c~";
 "editor_id" = 1018;
 "favorites_count" = 3725;
 id = 1027879;
 "image_urls" =                 (
 "http://img02.liwushuo.com/image/150720/6muyoln7u.jpg-w720",
 "http://img02.liwushuo.com/image/150720/7qn1iw8aw.jpg-w720",
 "http://img03.liwushuo.com/image/150720/1z4oi07aw.jpg-w720"
 );
 liked = 0;
 "likes_count" = 3725;
 name = "\U6ee4\U6ce1\U5f0f\U6302\U8033\U5305\U65e0\U7cd6\U9ed1\U5496\U5561*20\U888b";
 "post_ids" =                 (
 );
 price = "99.00";
 "purchase_id" = 42994922107;
 "purchase_status" = 1;
 "purchase_type" = 1;
 "purchase_url" = "http://s.click.taobao.com/t?e=m%3D2%26s%3DXj5LGn7VWxocQipKwQzePOeEDrYVVa64XoO8tOebS%2BdRAdhuF14FMWQH2naIYe9t8sviUM61dt2tgmtnxDX9deVMA5qBABUs5mPg1WiM1P5OS0OzHKBZzW1e2y4p13L5oNdcWDGGLVhx0Ed2mpQl0LLB5GN6fFXzxgxdTc00KD8%3D"; 淘宝购买链接
 "subcategory_id" = 85;
 "updated_at" = 1437374652;
 url = "http://www.liwushuo.com/items/1027879";
 "webp_urls" =                 (
 "http://img02.liwushuo.com/image/150720/6muyoln7u.jpg?imageView2/0/w/720/q/85/format/webp",
 "http://img02.liwushuo.com/image/150720/7qn1iw8aw.jpg?imageView2/0/w/720/q/85/format/webp",
 "http://img03.liwushuo.com/image/150720/1z4oi07aw.jpg?imageView2/0/w/720/q/85/format/webp"
 );
 },

 
 */

@interface FavoriteModel : NSObject

@property (nonatomic,copy) NSString *cover_image_url; //
@property (nonatomic,copy) NSString *cover_webp_url; //
@property (nonatomic,copy) NSString *descriptions; //
@property (nonatomic,strong) NSMutableArray *image_urls; //
@property (nonatomic,assign) NSInteger likes_count; //
@property (nonatomic,copy) NSString *price; //
@property (nonatomic,copy) NSString *purchase_url; //
@property (nonatomic,copy) NSString *url; //
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger editor_id; //
@property (nonatomic,assign) NSInteger identity;

@end
