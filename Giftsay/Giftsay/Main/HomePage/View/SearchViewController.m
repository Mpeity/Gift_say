//
//  SearchViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>
{
    UISearchBar *_searchBar;
}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_createSubviews {
    _searchBar = [[UISearchBar alloc   ] initWithFrame:CGRectZero];
    self.navigationItem.titleView = _searchBar;
    [_searchBar setPlaceholder:@"Search"]; // 搜索框的占位符
    [_searchBar setPrompt:@"Prompt"]; // 顶部提示文本，相当于控件的title
    [_searchBar setBarStyle:UIBarStyleDefault]; // 搜索框样式
    [_searchBar setTintColor:[UIColor blackColor]]; // 搜索框的颜色,当设置此属性时，barStyle将失效
//    [_searchBar setTranslucent:YES]; // 设置是否透明
//    [_searchBar setBackgroundImage:[UIImage imageNamed:@"me_profilebackground@2x"]]; // 设置背景图片
    [_searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"me_profilebackground@2x"] forState:UIControlStateNormal]; // 设置搜索框中文本框的背景
    [_searchBar setSearchFieldBackgroundPositionAdjustment:UIOffsetMake(0, 0)]; // 设置搜索框的背景的偏移量
    [_searchBar setSearchResultsButtonSelected:NO]; // 设置搜索结果按钮是否选中
    [_searchBar setShowsSearchResultsButton:YES]; // 设置是否显示搜索结果按钮
    [_searchBar setSearchTextPositionAdjustment:UIOffsetMake(0, 0)]; // 设置搜索框中文本框的文本偏移量
    
    UIView *hideView = [[UIView alloc] initWithFrame:CGRectZero];
    hideView.backgroundColor = [UIColor redColor];
    [_searchBar setInputAccessoryView:hideView]; //提供一个遮盖视图
    [_searchBar setKeyboardType:UIKeyboardTypeEmailAddress]; // 设置键盘的样式
    
    
    // 设置搜索框下边的分栏条
    [_searchBar setShowsScopeBar:YES]; // 是否显示分栏条
    [_searchBar setScopeButtonTitles:[NSArray arrayWithObjects:@"Singer",@"Song",@"Album", nil]]; // 分栏条，栏目
    [_searchBar setScopeBarBackgroundImage:[UIImage imageNamed:@"me_profilebackground@2x"]]; // 分栏条的背景颜色
    [_searchBar setSelectedScopeButtonIndex:1]; // 分栏条默认选中的按钮下标
    
    [_searchBar setShowsBookmarkButton:YES]; // 是否显示右侧的“书图标”
    [_searchBar setShowsCancelButton:YES]; //是否显示取消按钮
    // 是否提供自动修正功能（这个方法一般不用的）
    [_searchBar setSpellCheckingType:UITextSpellCheckingTypeYes]; // 设置自动检查的类型
    [_searchBar setAutocorrectionType:UITextAutocorrectionTypeDefault]; // 是否提供自动修正功能，一般设置为UITextAutocorrectionTypeDefault
    _searchBar.delegate = self; // 设置代理
    
    
    

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
