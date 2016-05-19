//
//  CollectFmbd.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/26.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

typedef void(^DBAllResultBlock)(FMDatabase *db, BOOL success, NSArray *resultArray);


@interface CollectFmbd : NSObject

@property (nonatomic,strong) FMDatabaseQueue *queue;

@property (nonatomic,strong) FMDatabase *db;

+ (instancetype)sharedManager;
// 添加数据
- (void)addIndex:(NSInteger)identity WithTitle:(NSString *)title WithCoverImgUrl:(NSString *)coverImageUrl WithUrl:(NSString *)url;
- (void)readAllProvinces:(DBAllResultBlock)resultBlock;

- (void)deleteDataWithIndex:(NSInteger)identity;

@end
