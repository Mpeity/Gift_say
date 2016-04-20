//
//  FuncTableView.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"


@interface FuncTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) NSMutableArray *itemArray;

@end
