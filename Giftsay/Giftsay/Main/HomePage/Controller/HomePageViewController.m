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
#import "ClassificationCollectionView.h"
#import "HeaderModel.h"
#import "FuncTableView.h"
#import "HeaderView.h"
#import "FuncCollectionView.h"

static NSString *cellId = @"cellId";
static NSString *funcTableCellId = @"funcTableCellId";

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_classficationView; //头部分类view
    FuncCollectionView *_funcCollectionView; // 各个分类对应的CollectionView视图
    ClassificationCollectionView *_classficationCollectionView; //
    NSMutableDictionary *_headerDic; //
    FuncTableView *_funcTableView;
    NSMutableArray *_array;
    HeaderView *_headerView;
    NSArray *_textArray;

    
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _headerDic = [[NSMutableDictionary alloc] init];
    _array = [[NSMutableArray alloc] init];
    [self _createSubviews];
//    [self _loadDada];
    //增加观察者
    [_funcCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    [_classficationCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
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
    _classficationView.backgroundColor = [UIColor purpleColor];
    [self _createClassificationView];
    [self.view addSubview:_classficationView];
    [self _createClassificationView];
    _classficationView.backgroundColor = [UIColor purpleColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kWidth, kHeight-_classficationView.height-64-49);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _funcCollectionView = [[FuncCollectionView alloc] initWithFrame:CGRectMake(0, kHeight*0.07+64, kWidth, kHeight-_classficationView.height-64-49) collectionViewLayout:layout];
    _funcCollectionView.backgroundColor = [UIColor clearColor];
    _funcCollectionView.contentOffset = CGPointMake(0, 0);
//    _funcCollectionView.delegate = self;
//    _funcCollectionView.dataSource = self;
    _funcCollectionView.pagingEnabled = YES;
//    [_funcCollectionView registerClass:[FuncCollectionViewCell class] forCellWithReuseIdentifier:funcCellId];
    [self.view addSubview:_funcCollectionView];
    _funcCollectionView.allArray = [_textArray mutableCopy];
    
}


#pragma mark - 加载数据
- (void)_loadDada {
    [DataService requestUrl:BANNERURL httpMethod:@"GET" params:nil block:^(id result) {
        NSArray *bannersArray = [[result objectForKey:@"data"] objectForKey:@"banners"];
        for (NSDictionary *dic in bannersArray) {
            HeaderModel *headerModel = [[HeaderModel alloc] init];
            headerModel.image_url = [dic objectForKey:@"image_url"];
            [_array addObject:headerModel];
            _headerView.headerArray = _array;
        }
    }];
}

#warning 头部collection还没完成
// 创建头部collectionView
- (void)_createClassificationView {
//    arrow_grey_down
    UIButton *funcButton = [[UIButton alloc] initWithFrame:CGRectMake(_classficationView.width-_classficationView.height, 0, _classficationView.height, _classficationView.height)];
    [funcButton setImage:[UIImage imageNamed:@"Xarrow_grey_up"] forState:UIControlStateNormal];
    [funcButton setImage:[UIImage imageNamed:@"Xarrow_grey_down"] forState:UIControlStateSelected];
    [funcButton addTarget:self action:@selector(funcButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_classficationView addSubview:funcButton];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kWidth-funcButton.width)/6, _classficationView.height);
    layout.minimumInteritemSpacing = 3;
    layout.minimumLineSpacing = 5;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _classficationCollectionView.itemWidth = _classficationView.height;
    _classficationCollectionView = [[ClassificationCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth-funcButton.width, _classficationView.height) collectionViewLayout:layout];
    [_classficationView addSubview:_classficationCollectionView];
    _textArray = @[@"精选",@"穿搭",@"海淘",@"生日",@"涨姿势",@"送闺蜜",@"饰品",@"美护",@"礼物",@"母婴",@"结婚",@"家居",@"美食",@"送爸妈",@"鞋包",@"纪念日",@"送同事",@"送男票"];
    _classficationCollectionView.allArray = [_textArray mutableCopy];
    
}


#pragma mark - 
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSNumber *number = [change objectForKey:@"new"];
    NSInteger index = [number integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    //小标题动了
    if ([object isKindOfClass:[ClassificationCollectionView class]] && _funcCollectionView.currentIndex != index) {
        
        [_funcCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _funcCollectionView.currentIndex = index;
    } else if ([object isKindOfClass:[FuncCollectionView class]] && _classficationCollectionView.currentIndex!= index){
        [_classficationCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];        
        _classficationCollectionView.currentIndex = index;
    }
    //更新 标题
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
