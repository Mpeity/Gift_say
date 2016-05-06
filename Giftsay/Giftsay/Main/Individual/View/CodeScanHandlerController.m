//
//  CodeScanHandlerController.m
//  TBL
//
//  Created by cuibaoyin on 14-10-20.
//  Copyright (c) 2014年 TB. All rights reserved.
//

#import "CodeScanHandlerController.h"

@interface CodeScanHandlerController ()
{
    NSString *scanResult;
}
@end

@implementation CodeScanHandlerController

- (id)initWithScanResult:(NSString *)result
{
    if (self = [super init])
    {
        scanResult = result;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth-50, 50, 50, 50)];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    [self setTitle:@"结果"];
    [self handleResult];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Methods
- (void)handleResult
{
    self.label_result.text = scanResult;
    [self.label_result sizeToFit];
}

@end
