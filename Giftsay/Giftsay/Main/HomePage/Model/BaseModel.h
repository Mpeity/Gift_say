//
//  BaseModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *share_msg;
@property (nonatomic,assign) NSInteger likes_count;
@property (nonatomic,copy) NSString *content_url;
@property (nonatomic,copy) NSString *cover_image_url;
@property (nonatomic,assign) NSInteger identity; //


@end
