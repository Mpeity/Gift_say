//
//  CodeScanHandlerController.h
//  TBL
//
//  Created by cuibaoyin on 14-10-20.
//  Copyright (c) 2014年 TB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeScanHandlerController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label_result;

- (id)initWithScanResult:(NSString *)result;

@end
