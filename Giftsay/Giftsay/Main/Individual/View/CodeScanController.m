
//
//  CodeScanController.m
//
//  Created by Bauyin Cui on 14-10-20.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "CodeScanController.h"
#import "CodeScanHandlerController.h"

@interface CodeScanController ()

@property (strong,nonatomic) AVCaptureDevice * device;
@property (strong,nonatomic) AVCaptureDeviceInput * input;
@property (strong,nonatomic) AVCaptureMetadataOutput * output;
@property (strong,nonatomic) AVCaptureSession * session;
@property (strong,nonatomic) AVCaptureVideoPreviewLayer * preview;

@end

@implementation CodeScanController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"扫描二维码"];
    self.edgesForExtendedLayout = NO;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self setupCamera];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IBAction

- (IBAction)backAction:(id)sender {
        [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - Methods
/**
 *  加载二维码扫描动画
 */
-(void)scanAnimation
{
    [UIView animateWithDuration:1 animations:^
    {
        CGFloat endPoint = 0.0f;
        if (self.imageview_sacnning.frame.origin.y < self.imageview_scan.center.y)
        {
            endPoint = self.imageview_scan.frame.origin.y + self.imageview_scan.frame.size.height - 5;
        }
        else
        {
            endPoint = self.imageview_scan.frame.origin.y + 5;
        }
        CGRect frame = self.imageview_sacnning.frame;
        frame.origin.y = endPoint;
        [self.imageview_sacnning setFrame:frame];
    }];
}

/**
 *  加载二维码扫描
 */
- (void)setupCamera
{
    if (self.session == nil)
    {
        self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
        self.output = [[AVCaptureMetadataOutput alloc]init];
        [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        self.session = [[AVCaptureSession alloc]init];
        [self.session setSessionPreset:AVCaptureSessionPresetHigh];
        if ([self.session canAddInput:self.input])
        {
            [self.session addInput:self.input];
        }
        
        if ([self.session canAddOutput:self.output])
        {
            [self.session addOutput:self.output];
        }
        
        // 条码类型 AVMetadataObjectTypeQRCode
        self.output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
        
        // Preview
        self.preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
        self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.preview.frame = self.view.bounds;
        [self.view.layer insertSublayer:self.preview atIndex:0];
    }

    [self.session startRunning];
    
    //扫描动画
    if (timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scanAnimation) userInfo:nil repeats:YES];
    }
}

/**
 *  处理扫描成功的信息
 *
 *  @param result 扫描出来的结果
 */
- (void)handleScanResult:(NSString *)result
{
    NSLog(@"扫码成功，信息为：%@",result);
    //跳转到处理信息界面
    CodeScanHandlerController *controller = [[CodeScanHandlerController alloc] initWithScanResult:result];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
    
    [timer invalidate];
    timer = nil;
    
    [self handleScanResult:stringValue];
}



@end
