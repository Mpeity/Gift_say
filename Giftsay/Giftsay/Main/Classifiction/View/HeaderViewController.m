//
//  HeaderViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "HeaderViewController.h"
#import "SpecialCollectionViewCell.h"
#import "DetailViewController.h"

static NSString *specialCellId = @"specialCellId";


@interface HeaderViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_specialCollectionView;
    NSMutableArray *_specialMutableArray;
}

@end

@implementation HeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _specialMutableArray = [[NSMutableArray alloc] init];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor oldLace];
    self.title = _specialModel.title;
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
    _specialCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) collectionViewLayout:layout];
    UINib *nib = [UINib nibWithNibName:@"SpecialCollectionViewCell" bundle:nil];
    [_specialCollectionView registerNib:nib forCellWithReuseIdentifier:specialCellId];
    _specialCollectionView.showsVerticalScrollIndicator = NO;
    _specialCollectionView.dataSource = self;
    _specialCollectionView.delegate = self;
    _specialCollectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_specialCollectionView];
}

- (void)_loadData {
    // http://api.liwushuo.com/v1/collections/227/posts?channel=104&limit=5&offset=0  227 是id
    // #define SPECIALDETAIURL @"http://api.liwushuo.com/v1/collections/%@/posts?channel=104&limit=%@&offset=%@"
    NSString *url = [NSString stringWithFormat:@"http://api.liwushuo.com/v1/collections/%@/posts?channel=104&limit=%@&offset=%@",[NSNumber numberWithInteger:_specialModel.identity],[NSNumber numberWithInteger:_specialModel.posts_count],@0];
    
    //    @property (nonatomic,copy) NSString *title;
    //    @property (nonatomic,copy) NSString *url;
    //    @property (nonatomic,copy) NSString *share_msg;
    //    @property (nonatomic,assign) NSInteger likes_count;
    
    [DataService requestUrl:url httpMethod:@"GET" params:nil block:^(id result) {
        //                NSLog(@"%@",result);
        NSArray *postsArray = [[result objectForKey:@"data"] objectForKey:@"posts"];
        for (NSDictionary *dic in postsArray) {
            SpecialDetailModel *specialDetailModel = [[SpecialDetailModel alloc] init];
            specialDetailModel.title = [dic objectForKey:@"title"];
            specialDetailModel.url = [dic objectForKey:@"url"];
            specialDetailModel.share_msg = [dic objectForKey:@"share_msg"];
            specialDetailModel.likes_count = [[dic objectForKey:@"likes_count"] integerValue];
            specialDetailModel.content_url = [dic objectForKey:@"content_url"];
            specialDetailModel.cover_image_url = [dic objectForKey:@"cover_image_url"];
            [_specialMutableArray addObject:specialDetailModel];
        }
        [_specialCollectionView reloadData];
    }];
}

- (void)setSpecialModel:(SpecialModel *)specialModel {
    if (_specialModel != specialModel) {
        _specialModel = specialModel;
    }
}

#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _specialMutableArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SpecialCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:specialCellId forIndexPath:indexPath];
    cell.specialDetailModel = _specialMutableArray[indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SpecialDetailModel *specialModel = _specialMutableArray[indexPath.row];
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.specialDetalModel = specialModel;
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
