//
//  ChannelsModel.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/21.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "ChannelsModel.h"


#define kgroup_idKey @"group_id";
#define kidentityKey @"identity";
#define kicon_urlKey @"icon_url";
#define kicon_nameKey @"icon_name";
#define kitems_count @"items_count";


@implementation ChannelsModel

#pragma mark-NSCoding
//@property (nonatomic,assign) NSInteger group_id;
//@property (nonatomic,assign) NSInteger identity;
//@property (nonatomic,copy) NSString *icon_url;
//@property (nonatomic,copy) NSString *icon_name;
//@property (nonatomic,assign) NSInteger items_count;

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.icon_name forKey:@"icon_name"];
    [aCoder encodeObject:self.icon_url forKey:@"icon_url"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.group_id] forKey:@"group_id"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.identity] forKey:@"identity"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.items_count] forKey:@"items_count"];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super init]) {
        _identity = [[aDecoder decodeObjectForKey:@"identity"] integerValue];
        _icon_name = [aDecoder decodeObjectForKey:@"icon_name"];
        _items_count = [[aDecoder decodeObjectForKey:@"items_count"] integerValue];
        _icon_url = [aDecoder decodeObjectForKey:@"icon_url"];
        _group_id = [[aDecoder decodeObjectForKey:@"group_id"] integerValue];
    }
    
    return self;
}

@end
