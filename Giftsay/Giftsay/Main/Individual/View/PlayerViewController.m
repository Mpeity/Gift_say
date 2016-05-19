//
//  PlayerViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/5/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat heigth;
@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,getter=isPlaying) BOOL playing;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UISlider *progressSilder;

@property (nonatomic,strong) UILabel *timer1;
@property (nonatomic,strong) UILabel *timer2;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timer1.hidden = NO;
    self.timer2.hidden = NO;
    self.playing = NO;
    [self configureSize];
    [self configurePlayer];
    [self addBackground];
    [self addTopBar];
    [self addButtomBar];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 10, 50, 50)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)backBtnAction {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//播放器
- (void)configurePlayer {
    NSString *musicFilePath = [[NSBundle mainBundle] pathForResource:@"yequ" ofType:@"mp3"];
    NSURL *musicURL = [[NSURL alloc] initFileURLWithPath:musicFilePath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    [self.player prepareToPlay];
    self.player.numberOfLoops=-1;
    self.player.volume=0.5;
}

//适配尺寸(代码重构)
- (void)configureSize {
    CGSize size = self.view.bounds.size;
    self.width = size.width;
    self.heigth = size.height;
}

//添加背景图片
- (void)addBackground {
    //    //设置背景图片
    //    UIImage *image = [UIImage imageNamed:@"november_chopin.jpg"];
    //    //将背景图片放在UIImageView图片视图上
    //    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:image];
    
    //代码重构
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"november_chopin.jpg"]];
    //让整个视图充满view
    bgImageView.frame = self.view.bounds;
    //调整图片显示
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    //添加子视图
    [self.view addSubview:bgImageView];
}

- (void)addButtomBar {
    UIView *buttomBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0.8*_heigth, _width, _heigth*0.2)];
    buttomBar.backgroundColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1];
    //设置透明度
    buttomBar.alpha = 0.85;
    [self.view addSubview:buttomBar];
    UIButton *playControl = [UIButton buttonWithType:UIButtonTypeCustom];
    playControl.frame = CGRectMake((self.width-70)/2, self.heigth*0.06, 70, 70);
    [playControl setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [buttomBar addSubview:playControl];
    [playControl addTarget:self action:@selector(playControlPressed:) forControlEvents:UIControlEventTouchUpInside];
        //添加进度条
    //UISlider *progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(40, 20, self.width-2*40, 20)];
    
    self.progressSilder = [[UISlider alloc] initWithFrame:CGRectMake(40, 20, self.width-2*40, 20)];
    [buttomBar addSubview:self.progressSilder];
    self.progressSilder.minimumValue = 0;
    self.progressSilder.maximumValue = 228;
    self.progressSilder.value = 0;
    //添加计时器
    self.timer1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 50, 50)];
    self.timer1.font = [UIFont systemFontOfSize:20];
    self.timer1.textAlignment = NSTextAlignmentCenter;
    self.timer1.textColor = [UIColor whiteColor];
    //self.timer1.backgroundColor = [UIColor whiteColor];
    

    self.timer2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 40, 50, 50)];
    self.timer2.textColor = [UIColor whiteColor];
    [buttomBar addSubview:self.timer1];
    [buttomBar addSubview:self.timer2];
}
//播放暂停功能
- (void)playControlPressed:(id)sender {
    UIButton *playControl = (UIButton *)sender;
    self.playing = !self.playing;
    if (self.isPlaying) {
        [playControl setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        [self.player play];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        self.timer1.text = [NSString stringWithFormat:@"%lf",self.progressSilder.value];
    }
    else {
        [playControl setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [self.player pause];
        [self.timer invalidate];
    }
}

- (void)timerAction {
    //    if (self.isPlaying) {
    //        self.progressSilder.value+=1;
    //    }
    
    self.progressSilder.value+=1;
    self.timer1.text = [NSString stringWithFormat:@"%li",(NSInteger)self.progressSilder.value];
    self.timer2.text = [NSString stringWithFormat:@"3:48"];

    //self.index+=1;
    
}


//添加topBar
- (void)addTopBar {
    
    //    CGSize size = self.view.bounds.size;
    //
    //    UIView *topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0,size.width,size.height * 0.10)];
    //
    //    UIView *topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height * 0.10)];
    
    UIView *topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0,_width, _heigth*0.10)];
    topBar.backgroundColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1];
    [self.view addSubview:topBar];
    UILabel *titleLable = [[UILabel alloc] initWithFrame:topBar.bounds];
    //添加文字 （作业 实现滚动）
    titleLable.text = @"周杰伦－夜曲";
    //设置颜色
    titleLable.textColor = [UIColor whiteColor];
    //调整字体的位置 居中
    titleLable.textAlignment = NSTextAlignmentCenter;
    //设置字体的大小
    titleLable.font = [UIFont systemFontOfSize:21];
    //添加子视图
    [topBar addSubview:titleLable];
    
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
