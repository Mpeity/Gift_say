//
//  CommonModel.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

//channel_groups = [
//{
//    status = 0,
//    id = 5,
//    channels = [
//    {
//        status = 0,
//        group_id = 5,
//        id = 111,
//        items_count = 923,
//        order = 10,
//        icon_url = http://img02.liwushuo.com/image/150615/yfdkhhsiy.png-pw144,
//        name = 礼物
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 110,
//        items_count = 481,
//        order = 9,
//        icon_url = http://img03.liwushuo.com/image/150615/l4lgl39lo.png-pw144,
//        name = 穿搭
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 118,
//        items_count = 309,
//        order = 7,
//        icon_url = http://img03.liwushuo.com/image/150621/tr9ey20fo.png-pw144,
//        name = 美食
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 2,
//        items_count = 466,
//        order = 6,
//        icon_url = http://img01.liwushuo.com/image/141016/dexjj8lzh.png-pw144,
//        name = 美物
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 117,
//        items_count = 143,
//        order = 6,
//        icon_url = http://img02.liwushuo.com/image/150615/i0uqb170o.png-pw144,
//        name = 鞋包
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 116,
//        items_count = 161,
//        order = 6,
//        icon_url = http://img02.liwushuo.com/image/150615/6alx8bqwb.png-pw144,
//        name = 饰品
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 113,
//        items_count = 353,
//        order = 6,
//        icon_url = http://img03.liwushuo.com/image/150615/5zouv5seq.png-pw144,
//        name = 美护
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 121,
//        items_count = 149,
//        order = 5,
//        icon_url = http://img03.liwushuo.com/image/150615/qfa5oigpq.png-pw144,
//        name = 数码
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 3,
//        items_count = 84,
//        order = 4,
//        icon_url = http://img03.liwushuo.com/image/141016/ex1paaj74.png-pw144,
//        name = 手工
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 112,
//        items_count = 495,
//        order = 4,
//        icon_url = http://img01.liwushuo.com/image/150615/tw6o1xiud.png-pw144,
//        name = 家居
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 119,
//        items_count = 38,
//        order = 0,
//        icon_url = http://img02.liwushuo.com/image/150615/q8p2xqnun.png-pw144,
//        name = 母婴
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 120,
//        items_count = 126,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/150615/r2g76rg44.png-pw144,
//        name = 涨姿势
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 122,
//        items_count = 57,
//        order = 0,
//        icon_url = http://img01.liwushuo.com/image/150618/3t35d6fzq.png-pw144,
//        name = 爱动漫
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 123,
//        items_count = 26,
//        order = 0,
//        icon_url = http://img01.liwushuo.com/image/150615/7knhd10dc.png-pw144,
//        name = 爱运动
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 124,
//        items_count = 11,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/150615/6tlti6gjc.png-pw144,
//        name = 爱读书
//    },
//    {
//        status = 0,
//        group_id = 5,
//        id = 129,
//        items_count = 96,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/151109/ed8se6ejt.png-pw144,
//        name = 海淘
//    }
//                ],
//    order = 5,
//    name = 品类
//},
//                  
//                  
//                  
//{
//    status = 0,
//    id = 2,
//    channels = [
//    {
//        status = 0,
//        group_id = 2,
//        id = 10,
//        items_count = 424,
//        order = 8,
//        icon_url = http://img03.liwushuo.com/image/141016/occ7ccxd5.png-pw144,
//        name = 送女票
//    },
//    {
//        status = 0,
//        group_id = 2,
//        id = 9,
//        items_count = 266,
//        order = 7,
//        icon_url = http://img01.liwushuo.com/image/141016/lhcswxt1y.png-pw144,
//        name = 送男票
//    },
//    {
//        status = 0,
//        group_id = 2,
//        id = 24,
//        items_count = 84,
//        order = 6,
//        icon_url = http://img01.liwushuo.com/image/141205/knuvffrcd.png-pw144,
//        name = 送宝贝
//    },
//    {
//        status = 0,
//        group_id = 2,
//        id = 6,
//        items_count = 189,
//        order = 5,
//        icon_url = http://img03.liwushuo.com/image/141016/mva3k82oa.png-pw144,
//        name = 送爸妈
//    },
//    {
//        status = 0,
//        group_id = 2,
//        id = 26,
//        items_count = 571,
//        order = 5,
//        icon_url = http://img02.liwushuo.com/image/141205/1ts0zalh7.png-pw144,
//        name = 送基友
//    },
//    {
//        status = 0,
//        group_id = 2,
//        id = 5,
//        items_count = 1028,
//        order = 4,
//        icon_url = http://img02.liwushuo.com/image/141016/whnu7hx88.png-pw144,
//        name = 送闺蜜
//    },
//    {
//        status = 0,
//        group_id = 2,
//        id = 17,
//        items_count = 76,
//        order = 2,
//        icon_url = http://img01.liwushuo.com/image/141016/htb7at52l.png-pw144,
//        name = 送同事
//    }
//                ],
//    order = 4,
//    name = 对象
//},
//                  
//                  
//                  
//{
//    status = 0,
//    id = 4,
//    channels = [
//    {
//        status = 0,
//        group_id = 4,
//        id = 131,
//        items_count = 24,
//        order = 9,
//        icon_url = http://img03.liwushuo.com/image/151219/pe29lemsx.png-pw144,
//        name = 圣诞节
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 30,
//        items_count = 80,
//        order = 8,
//        icon_url = http://img01.liwushuo.com/image/141205/i0545wnko.png-pw144,
//        name = 生日
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 32,
//        items_count = 253,
//        order = 7,
//        icon_url = http://img02.liwushuo.com/image/141205/a9u8vmo7j.png-pw144,
//        name = 情人节
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 33,
//        items_count = 18,
//        order = 6,
//        icon_url = http://img03.liwushuo.com/image/141205/xpab3kse5.png-pw144,
//        name = 结婚
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 31,
//        items_count = 24,
//        order = 5,
//        icon_url = http://img01.liwushuo.com/image/141205/butbllex6.png-pw144,
//        name = 纪念日
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 35,
//        items_count = 206,
//        order = 4,
//        icon_url = http://img01.liwushuo.com/image/141213/v86hpeftq.png-pw144,
//        name = 乔迁礼物
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 36,
//        items_count = 110,
//        order = 0,
//        icon_url = http://img02.liwushuo.com/image/141220/6lgx9d6tw.png-pw144,
//        name = 感谢
//    },
//    {
//        status = 0,
//        group_id = 4,
//        id = 39,
//        items_count = 208,
//        order = -1,
//        icon_url = http://img02.liwushuo.com/image/150124/2iltg81aw.png-pw144,
//        name = 新年
//    }
//                ],
//    order = 3,
//    name = 场合
//},
//                  
//                  
//                  
//{
//    status = 0,
//    id = 1,
//    channels = [
//    {
//        status = 0,
//        group_id = 1,
//        id = 125,
//        items_count = 85,
//        order = 5,
//        icon_url = http://img03.liwushuo.com/image/150618/6plyrz2qq.png-pw144,
//        name = 创意生活
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 11,
//        items_count = 162,
//        order = 4,
//        icon_url = http://img02.liwushuo.com/image/141016/ka5jhbrxz.png-pw144,
//        name = 萌萌哒
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 14,
//        items_count = 290,
//        order = 3,
//        icon_url = http://img02.liwushuo.com/image/141016/v8i6mjebe.png-pw144,
//        name = 小清新
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 28,
//        items_count = 81,
//        order = 3,
//        icon_url = http://img03.liwushuo.com/image/141205/9h183f7k8.png-pw144,
//        name = 科技范
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 126,
//        items_count = 21,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/150618/5achk94ie.png-pw144,
//        name = 奇葩搞怪
//    },
//    {
//        status = 0,
//        group_id = 1,
//        id = 127,
//        items_count = 80,
//        order = 0,
//        icon_url = http://img03.liwushuo.com/image/150618/h0fczbucb.png-pw144,
//        name = 设计感
//    }
//                ],
//    order = 2,
//    name = 风格
//}
//                  ]


@interface CommonModel : NSObject

@end
