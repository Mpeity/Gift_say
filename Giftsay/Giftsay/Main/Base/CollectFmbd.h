//
//  CollectFmbd.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/26.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface CollectFmbd : NSObject

@property (nonatomic,strong) FMDatabaseQueue *queue;

@property (nonatomic,strong) FMDatabase *db;

@end
