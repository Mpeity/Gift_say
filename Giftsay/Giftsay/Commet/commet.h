//
//  commet.h
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#ifndef commet_h
#define commet_h



// 所有接口
// 横幅
#define BANNERURL @"http://api.liwushuo.com/v1/banners?channel=iOS"
// 推荐
#define PROMOTIONURL @"http://api.liwushuo.com/v2/promotions"

// 精选攻略
#define ITEMSURL @"http://api.liwushuo.com/v2/channels/104/items?"

// 热门礼物
#define HOTURL @"http://api.liwushuo.com/v1/item_channels/1/items?"

// 分类专题 (分类 查看全部按钮)
#define SPECIALURL @"http://api.liwushuo.com/v1/collections?channel=104&limit=%@&offset=%@"

// 专题详情 http://api.liwushuo.com/v1/collections/227/posts?channel=104&limit=5&offset=0  227 是id
#define SPECIALDETAIURL @"http://api.liwushuo.com/v1/collections/%@/posts?channel=104&limit=%@&offset=%@"

// 分类中的各种图标 （分类页面  品类等各种图标）
#define CHANNELURL @"http://api.liwushuo.com/v1/channel_groups/all"

// 分类个类的详情 “http://api.liwushuo.com/v1/channels/id/items?channels=104&limit=10&offset=0”
#define CHANNELDETAILURL @"http://api.liwushuo.com/v1/channels/%@/items?channels=104&limit=20&offset=%@"

// 礼物详情
#define DETAILURL @"http://api.liwushuo.com/v2/items/%@"

// 礼物评论
#define COMMENTURL @"http://api.liwushuo.com/v2/items/%@/comments?limit=20&offset=%@"

// 攻略搜索
#define SEARCHURL @"http://api.liwushuo.com/v1/search/post?keyword=%@&limit=20&offset=%@&sort="

// 礼物搜索
#define GIFTSEARCHURL @"http://api.liwushuo.com/v1/search/item?keyword=%@&limit=20&offset=%@&sort="


#define  kWidth [UIScreen mainScreen].bounds.size.width
#define  kHeight [UIScreen mainScreen].bounds.size.height




#endif /* commet_h */
