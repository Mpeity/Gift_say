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
    [self setTitle:@"结果"];
    [self handleResult];
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
