//
//  GiftFmdb.m
//  Giftsay
//
//  Created by nick_beibei on 16/5/6.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "GiftFmdb.h"
#import "FavoriteModel.h"


@implementation GiftFmdb

+ (instancetype)sharedManager {
    
    static GiftFmdb *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GiftFmdb alloc] init];
    });
    return manager;
}

//- (instancetype)init {
//    if (self = [super init]) {
//        [self createDb];
//    }
//    return self;
//}

//@property (nonatomic,copy) NSString *title;
//@property (nonatomic,copy) NSString *cover_image_url;
//@property (nonatomic,assign) NSInteger identity; //

- (void)createDb {
    NSLog(@"%@",NSHomeDirectory());
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    // 拼接文件名
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"giftFMDB.sqlite"];
    //     创建数据库实例
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    //     创建数据库表
    //     提供一个多线程安全的数据库实例
    [queue inDatabase:^(FMDatabase *db) {
        BOOL flag = [db executeUpdate:@"create table if not exists t_giftFMDB (id integer primary key autoincrement,identity integer,descriptions text,coverImageUrl text)"];
        if (flag) {
            NSLog(@"创建表 success");
        } else {
            NSLog(@"创建表 failed");
        }
    }];
    _queue = queue; //
}

// 添加数据
- (void)addIndex:(NSInteger)identity WithTitle:(NSString *)title WithCoverImgUrl:(NSString *)coverImageUrl {
    [self createDb];
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL flag = [db executeUpdate:@"insert into t_giftFMDB (identity,descriptions,coverImageUrl) values (?,?,?)",[NSNumber numberWithInteger:identity],title,coverImageUrl];
        if (flag) {
            NSLog(@"add success");
        } else {
            NSLog(@"add failed");
        }
    }];
}

//删除数据
- (void)deleteDataWithIndex:(NSInteger)identity {
    //DELETE FROM SUser WHERE uid = '%@'",uid
    [self createDb];
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL flag = [db executeUpdate:@"delete from t_giftFMDB where identity = ?",[NSNumber numberWithInteger:identity]];
        if (flag) {
            NSLog(@"delete %ld success",identity);
        } else {
            NSLog(@"delete %ld failed",identity);
        }
        
    }];
    
    
}


//修改数据
- (void)updateBtn:(NSInteger)count {
    
    [_queue inDatabase:^(FMDatabase *db) {
        // 开启事务
        [db beginTransaction];
        BOOL flag = [db executeUpdate:@"update t_giftFMDB set money = ? where name = ?;",@500,@"zhangsan"];
        if (flag) {
            NSLog(@"update success");
        } else {
            NSLog(@"update failed");
            // 回滚
            [db rollback];
        }
        
        BOOL flag1 = [db executeUpdate:@"update t_user set money = ? where name = ?;",@1000,@"lisi"];
        if (flag1) {
            NSLog(@"update success");
        } else {
            NSLog(@"update failed");
            // 回滚
            [db rollback];
        }
        // 全部操作完成时再提交
        [db commit];
        
    }];
    
}

//查询数据

- (void)readAllProvinces:(DBAllResultBlock)resultBlock {
    [self createDb];
    NSMutableArray *arrM = [NSMutableArray array];
    
    [self.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        FMResultSet *resultSet = [db executeQuery:@"select * from t_giftFMDB"];
        
        while (resultSet.next) {
            
            FavoriteModel *baseModel = [[FavoriteModel  alloc] init];
            baseModel.descriptions = [resultSet stringForColumn:@"descriptions"];
            baseModel.cover_image_url = [resultSet stringForColumn:@"coverImageUrl"];
            baseModel.identity = [[resultSet stringForColumn:@"identity"] integerValue];
            [arrM addObject:baseModel];
        }
        [resultSet close];
        
        resultBlock(db, YES, arrM);
    }];
}

//- (void)queryBtn {
//// identity integer,title text,coverImageUrl text
//    [_queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *result = [db executeQuery:@"select * from t_collectFMDB;"];
//        while ([result next]) {
//            NSString *title = [result stringForColumn:@"title"];
//            NSString *coverImageUrl = [result stringForColumn:@"coverImageUrl"];
//            NSInteger identy = [[result stringForColumn:@"identity"] integerValue];
//            NSLog(@"%@ %@ %ld",title,coverImageUrl,identy);
//        }
//
//    }];
//}

@end
