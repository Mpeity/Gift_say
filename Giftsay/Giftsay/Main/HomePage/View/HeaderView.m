//
//  HeaderView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "HeaderView.h"
#import "HeaderModel.h"
#import "TargetModel.h"

@implementation HeaderView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _headerArray = [[NSMutableArray alloc] init];
        [self _loadDada];

//        [self _createSubviews];


    }
    return self;
}



#pragma mark - 创建tableView的头部视图
- (void)_createSubviews{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height*0.6)];
    _scrollView.contentSize = CGSizeMake(self.width*4, self.height*0.6);
    _scrollView.contentOffset = CGPointMake(0, 0); // 设置滚动的偏移量
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    NSLog(@"%@",_headerArray);
    [self addSubview:_scrollView];
    for (int i = 0; i<self.headerArray.count; i++) {
        HeaderModel *headerModel = [[HeaderModel alloc] init];
        headerModel = _headerArray[i];
        NSString *imageName = [NSString stringWithFormat:@"%@",headerModel.image_url];
        NSLog(@"%@",imageName);
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, kHeight*0.40)];
//        imgView.image = image;
        [imgView sd_setImageWithURL:[NSURL URLWithString:headerModel.image_url]];
        imgView.userInteractionEnabled = YES;
        [_scrollView addSubview:imgView];
//        [_scrollView addSubview:imgView];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, kHeight*0.40)];
        button.tag = 100+i;
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:button];
    }
    
}



- (void)setHeaderArray:(NSMutableArray *)headerArray {
    if (_headerArray != headerArray) {
        _headerArray = headerArray;
    }
}


// 获取数据 并解析
- (void)_loadDada {
    [DataService requestUrl:BANNERURL httpMethod:@"GET" params:nil block:^(id result) {
//        NSLog(@"%@",result);
        NSArray *bannersArray = [[result objectForKey:@"data"] objectForKey:@"banners"];
        for (NSDictionary *dic in bannersArray) {
            HeaderModel *headerModel = [[HeaderModel alloc] init];
            headerModel.image_url = [dic objectForKey:@"image_url"];
            [_headerArray addObject:headerModel];
//                    NSLog(@"%@",result);
        }
        [self _createSubviews];
//        for (int i = 0; i<self.headerArray.count; i++) {
//            HeaderModel *headerModel = [[HeaderModel alloc] init];
//            headerModel = _headerArray[i];
//            NSString *imageName = [NSString stringWithFormat:@"%@",headerModel.image_url];
//            NSLog(@"%@",imageName);
//            UIImage *image = [UIImage imageNamed:imageName];
//            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, kHeight*0.40)];
//            //        imgView.image = image;
//            [imgView sd_setImageWithURL:[NSURL URLWithString:headerModel.image_url]];
//            imgView.userInteractionEnabled = YES;
//            [_scrollView addSubview:imgView];
//            //        [_scrollView addSubview:imgView];
//            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kWidth*i, 0, kWidth, kHeight*0.40)];
//            button.tag = 100+i;
//            button.backgroundColor = [UIColor clearColor];
//            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//            [_scrollView addSubview:button];
//        }
    }];
}

- (void)buttonAction:(UIButton *)button {
    NSLog(@"11111");
}




#pragma mark - scrollViewDelegate





#pragma mark - collectionViewDelegate















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
