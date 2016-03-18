//
//  SpecialModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 data = {
	collections = [
 {
	cover_image_url = http://img03.liwushuo.com/image/160317/3af7hpan1.jpg-w720,
	id = 227,
	posts_count = 6,
	banner_webp_url = http://img02.liwushuo.com/image/160317/1waks9fpe.jpg?imageView2/0/w/300/q/85/format/webp,
	subtitle = 让男神心动的早春穿搭,
	banner_image_url = http://img02.liwushuo.com/image/160317/1waks9fpe.jpg-w300,
	cover_webp_url = http://img03.liwushuo.com/image/160317/3af7hpan1.jpg?imageView2/0/w/720/q/85/format/webp,
	created_at = 1458185256,
	title = 早春穿搭指南,
	updated_at = 1458185256,
	status = 0
 },
 {
	cover_image_url = http://img03.liwushuo.com/image/160316/uru4aobbu.jpg-w720,
	id = 226,
	posts_count = 5,
	banner_webp_url = http://img02.liwushuo.com/image/160316/posf67kiv.jpg?imageView2/0/w/300/q/85/format/webp,
	subtitle = 是来自玻璃杯的艺术,
	banner_image_url = http://img02.liwushuo.com/image/160316/posf67kiv.jpg-w300,
	cover_webp_url = http://img03.liwushuo.com/image/160316/uru4aobbu.jpg?imageView2/0/w/720/q/85/format/webp,
	created_at = 1458120650,
	title = 握在手中的美好,
	updated_at = 1458120650,
	status = 0
 },

 */


@interface SpecialModel : NSObject

@property (nonatomic,copy) NSString *cover_image_url; //
@property (nonatomic,assign) NSInteger identity; //
@property (nonatomic,assign) NSInteger posts_count; //
@property (nonatomic,copy) NSString *banner_image_url; //
@property (nonatomic,copy) NSString *subtitle; //
@property (nonatomic,copy) NSString *title; //

@end
