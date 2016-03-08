//
//  GuideViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "GuideViewController.h"
#import "ChoiceViewController.h"

@interface GuideViewController ()<UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
}

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    ChoiceViewController *vc = [[ChoiceViewController alloc] initWithNibName:@"ChoiceViewController" bundle:nil];
    [self presentViewController:vc animated:NO completion:nil];
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
