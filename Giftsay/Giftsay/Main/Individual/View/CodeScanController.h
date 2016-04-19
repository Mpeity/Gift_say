//
//  CodeScanController.h
//
//  Created by Bauyin Cui on 14-10-20.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CodeScanController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    NSTimer * timer;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageview_scan;
@property (weak, nonatomic) IBOutlet UIImageView *imageview_sacnning;


@end
