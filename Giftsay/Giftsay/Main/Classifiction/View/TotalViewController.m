//
//  TotalViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/22.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "TotalViewController.h"
#import "TotalCollectionViewCell.h"
#import "TotalModel.h"
#import "SpecialViewController.h"

static NSString *totalCellId = @"totalCellId";

@interface TotalViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_totalCollectionView;
    NSMutableArray *_totalMutableArray;
}

@end

@implementation TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"礼物说";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor honeydew];
    _totalMutableArray = [[NSMutableArray alloc] init];
    [self _createSubviews];
    [self _loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_createSubviews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kWidth-20 ,(kWidth-20)*13/28);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _totalCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) collectionViewLayout:layout];
    UINib *nib = [UINib nibWithNibName:@"TotalCollectionViewCell" bundle:nil];
    [_totalCollectionView registerNib:nib forCellWithReuseIdentifier:totalCellId];
    _totalCollectionView.showsVerticalScrollIndicator = NO;
    _totalCollectionView.dataSource = self;
    _totalCollectionView.delegate = self;
    _totalCollectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_totalCollectionView];
}

- (void)_loadData {
//    @property (nonatomic,copy) NSString *cover_image_url;
//    @property (nonatomic,copy) NSString *banner_image_url;
//    @property (nonatomic,copy) NSString *subtitle;
//    @property (nonatomic,copy) NSString *title;
//    @property (nonatomic,copy) NSString *next_url;
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@10 forKey:@"limit"];
    [params setObject:@0 forKey:@"offset"];
    [DataService requestUrl:@"http://api.liwushuo.com/v1/collections?channel=104" httpMethod:@"GET" params:params block:^(id result) {
//        NSLog(@"%@",result);
        NSArray *collectionsArray = [[result objectForKey:@"data"] objectForKey:@"collections"];
        for (NSDictionary *dic in collectionsArray) {
            TotalModel *totalModel = [[TotalModel alloc] init];
            totalModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            totalModel.banner_image_url = [dic objectForKey:@"banner_image_url"];
            totalModel.subtitle = [dic objectForKey:@"subtitle"];
            totalModel.title = [dic objectForKey:@"title"];
            totalModel.identity = [[dic objectForKey:@"id"] integerValue];
            totalModel.status = [[dic objectForKey:@"status"] integerValue];
            totalModel.posts_count = [[dic objectForKey:@"posts_count"] integerValue];
            [_totalMutableArray addObject:totalModel];
        }
        [_totalCollectionView reloadData];
    }];
}

#pragma mark - collectionViewDelegate 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _totalMutableArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TotalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:totalCellId forIndexPath:indexPath];
    cell.totalModel = _totalMutableArray[indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SpecialViewController *vc = [[SpecialViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    TotalModel *totalModel = _totalMutableArray[indexPath.row];
    vc.totalModel = totalModel;
    vc.title = totalModel.title;
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
