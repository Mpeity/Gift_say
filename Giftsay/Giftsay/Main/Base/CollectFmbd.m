//
//  CollectFmbd.m
//  Giftsay
//
//  Created by nick_beibei on 16/4/26.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "CollectFmbd.h"
#import "BaseModel.h"
#import "ItemsModel.h"

@implementation CollectFmbd

+ (instancetype)sharedManager {
    
    static CollectFmbd *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CollectFmbd alloc] init];
    });
    return manager;
}

//@property (nonatomic,copy) NSString *title;
//@property (nonatomic,copy) NSString *cover_image_url;
//@property (nonatomic,assign) NSInteger identity; //

- (void)createDb {
    NSLog(@"%@",NSHomeDirectory());
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    // 拼接文件名
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"collectFMDB.sqlite"];
//     创建数据库实例
        FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:filePath];
//     创建数据库表
//     提供一个多线程安全的数据库实例
        [queue inDatabase:^(FMDatabase *db) {
            BOOL flag = [db executeUpdate:@"create table if not exists t_collectFMDB (id integer primary key autoincrement,identity integer,title text,coverImageUrl text,url text)"];
            if (flag) {
                NSLog(@"创建表 success");
            } else {
                NSLog(@"创建表 failed");
            }
        }];
        _queue = queue; //
}

// 添加数据
- (void)addIndex:(NSInteger)identity WithTitle:(NSString *)title WithCoverImgUrl:(NSString *)coverImageUrl WithUrl:(NSString *)url {
    [self createDb];
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL flag = [db executeUpdate:@"insert into t_collectFMDB (identity,title,coverImageUrl,url) values (?,?,?,?)",[NSNumber numberWithInteger:identity],title,coverImageUrl,url];
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
        BOOL flag = [db executeUpdate:@"delete from t_collectFMDB where identity = ?",[NSNumber numberWithInteger:identity]];
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
        BOOL flag = [db executeUpdate:@"update t_collectFMDB set money = ? where name = ?;",@500,@"zhangsan"];
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
        FMResultSet *resultSet = [db executeQuery:@"select * from t_collectFMDB"];
        while (resultSet.next) {
            BaseModel *baseModel = [[BaseModel  alloc] init];
            baseModel.identity = [[resultSet stringForColumn:@"identity"] integerValue];
            baseModel.title = [resultSet stringForColumn:@"title"];
            baseModel.cover_image_url = [resultSet stringForColumn:@"coverImageUrl"];
            baseModel.url = [resultSet stringForColumn:@"url"];
            [arrM addObject:baseModel];
//            ItemsModel *baseModel = [[ItemsModel  alloc] init];
//            baseModel.title = [resultSet stringForColumn:@"title"];
//            baseModel.cover_image_url = [resultSet stringForColumn:@"coverImageUrl"];
//            baseModel.identity = [[resultSet stringForColumn:@"identity"] integerValue];
//            baseModel.url = [resultSet stringForColumn:@"url"];
//            [arrM addObject:baseModel];
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
