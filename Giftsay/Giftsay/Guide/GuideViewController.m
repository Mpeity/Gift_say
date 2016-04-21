//
//  GuideViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "GuideViewController.h"
#import "ChoiceViewController.h"
#import "ChannelsModel.h"
#import "CommonModel.h"

@interface GuideViewController ()<UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
    NSMutableArray *_allMutaleArray;
    ChoiceViewController *_vc;

}

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _vc = [[ChoiceViewController alloc] initWithNibName:@"ChoiceViewController" bundle:nil];
    _allMutaleArray = [[NSMutableArray alloc] init];
    [self _loadCommonData];
    [self _createSubview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - 创建子视图
- (void)_createSubview {
    self.startButton.hidden = YES;
    [self.startButton setBackgroundImage:[UIImage imageNamed:@"btn_begin.png"] forState:UIControlStateNormal];
    
    self.guideScroll.delegate = self;
    self.guideScroll.contentSize = CGSizeMake(4*kWidth, kHeight);
    self.guideScroll.pagingEnabled = YES;
    self.guideScroll.showsHorizontalScrollIndicator = NO;
    for (int i = 0; i<4; i++) {
        NSString *imageName = [NSString stringWithFormat:@"walkthrough_%i.jpg",i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kWidth, 0, kWidth, kHeight)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [self.guideScroll addSubview:imageView];
    }

    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.startButton.frame), kHeight-self.startButton.height-25, self.startButton.width, self.startButton.height)];
    _pageControl.numberOfPages = 4;
    [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
}

#pragma mark - scrollView 代理方法
//当滑动视图,减速停止时,调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/kWidth;
    _pageControl.currentPage = index;
    if (index == 3) {
        self.startButton.hidden = NO;
        _pageControl.hidden = YES;
    } else {
        self.startButton.hidden = YES;
        _pageControl.hidden = NO;
    }
}

#pragma mark - pageControl响应方法
- (void)pageControlAction:(UIPageControl *)pageControl {
    NSInteger index = pageControl.currentPage;
    _guideScroll.contentOffset = CGPointMake(kWidth*index, 0);
}

#pragma mark - button响应方法
- (IBAction)buttonAction:(id)sender {

    [self presentViewController:_vc animated:NO completion:nil];
}


- (void)_loadCommonData {
    [DataService requestUrl:CHANNELURL httpMethod:@"GET" params:nil block:^(id result) {
        NSArray *commonArray = [[result objectForKey:@"data"] objectForKey:@"channel_groups"];
        for (NSDictionary *dic in commonArray) {
            CommonModel *commonModel = [[CommonModel alloc] init];
            commonModel.groupArray = [[NSMutableArray alloc] init];
            commonModel.order = [[dic objectForKey:@"order"] integerValue];
            commonModel.name = [dic objectForKey:@"name"];
            commonModel.identity = [[dic objectForKey:@"id"] integerValue];
            NSArray *channelsArray = [dic objectForKey:@"channels"];
            for (NSDictionary *dataDic in channelsArray) {
                ChannelsModel *channelsModel = [[ChannelsModel alloc] init];
                channelsModel.group_id = [[dataDic objectForKey:@"group_id"] integerValue];
                channelsModel.identity = [[dataDic objectForKey:@"id"] integerValue];
                channelsModel.icon_name = [dataDic objectForKey:@"name"];
                channelsModel.icon_url = [dataDic objectForKey:@"icon_url"];
                channelsModel.items_count = [[dataDic objectForKey:@"items_count"] integerValue];
                [_allMutaleArray addObject:channelsModel];
                _vc.allMutaleArray = _allMutaleArray;
            }
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
