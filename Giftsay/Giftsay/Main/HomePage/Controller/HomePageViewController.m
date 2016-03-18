//
//  HomePageViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "HomePageViewController.h"
#import "LogInViewController.h"
#import "SearchViewController.h"
#import "FuncCollectionView.h"
#import "ClassificationCollectionView.h"

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_classficationView; //头部分类view
    FuncCollectionView *_funcCollectionView; // 各个分类对应的CollectionView视图
    ClassificationCollectionView *_classficationCollectionView; //
    NSMutableDictionary *_headerDic; // 
    
    
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _headerDic = [[NSMutableDictionary alloc] init];
    
    
    [self _createSubviews];
//    [self _loadDada];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建子视图
- (void)_createSubviews {
    // 自定义nav
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton setImage:[UIImage imageNamed:@"btn_check_selected"] forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(leftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.title = @"礼物说";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_check_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"abc_ic_search_api_holo_light"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction:)];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // 头部分类view
    _classficationView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight*0.07)];
//    _classficationView.backgroundColor = [UIColor purpleColor];
    [self _createClassificationView];
    [self.view addSubview:_classficationView];
    
    
    
    
    // 创建每个CollectionView视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc ]init];
    layout.itemSize = CGSizeMake(kWidth, kHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _funcCollectionView = [[FuncCollectionView alloc] initWithFrame:CGRectMake(0, kHeight*0.07, kWidth, kHeight*0.93) collectionViewLayout:layout];
    [self.view addSubview:_funcCollectionView];
    
    
}

#pragma mark - 加载数据
- (void)_loadDada {
    

}

#warning 头部collection还没完成
// 创建头部collectionView
- (void)_createClassificationView {
    UIButton *funcButton = [[UIButton alloc] initWithFrame:CGRectMake(_classficationView.width-_classficationView.height, 0, _classficationView.height, _classficationView.height)];
    [funcButton setImage:[UIImage imageNamed:@"arrow_index_up"] forState:UIControlStateNormal];
    [funcButton setImage:[UIImage imageNamed:@"arrow_index_down"] forState:UIControlStateSelected];
    [funcButton addTarget:self action:@selector(funcButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_classficationView addSubview:funcButton];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kWidth-funcButton.width)/6, _classficationView.height);
//    layout.minimumInteritemSpacing = 3;
    layout.minimumLineSpacing = 5;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _classficationCollectionView = [[ClassificationCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth-funcButton.width, _classficationView.height) collectionViewLayout:layout];
//    [_classficationCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    _classficationCollectionView.backgroundColor = [UIColor  waterPink];
//    _classficationCollectionView.delegate = self;
//    _classficationCollectionView.dataSource = self;
    [_classficationView addSubview:_classficationCollectionView];
//    _textArray = @[@"精选",@"穿搭",@"海淘",@"生日",@"涨姿势",@"送闺蜜",@"饰品",@"美护",@"礼物",@"母婴",@"结婚",@"家居",@"美食",@"送爸妈",@"鞋包",@"纪念日",@"送同事",@"送男票"];
}



#pragma mark - funcButtonAction 
- (void)funcButtonAction:(UIButton *)button {
    button.selected = !button.selected;

}

#pragma mark - navBarButtonAction
- (void)leftBarButtonAction:(UIBarButtonItem *)barButtonItem {
    LogInViewController *vc = [[LogInViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)rightBarButtonAction:(UIBarButtonItem *)barButtonItem {
    SearchViewController *vc = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
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
