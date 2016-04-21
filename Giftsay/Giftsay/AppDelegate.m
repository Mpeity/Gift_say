//
//  AppDelegate.m
//  Giftsay
//
//  Created by nick_beibei on 16/1/4.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "GuideViewController.h"
#import "ChoiceViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[MainTabBarController alloc] init];
//    self.window.rootViewController = [[GuideViewController alloc] init];
//    self.window.rootViewController = [[ChoiceViewController alloc] init];
    
    /**
     *  思路一(1)判断 沙盒有没有某个文件a
     如果有 则不是第一次
     如果没有 则是第一次
     思路二 根据文件中的某个值来判断是否是第一次启动
     
     */
    BOOL notFirst = YES;
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/firstStart.plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSNumber *number = [dic objectForKey:@"notFirst"];
    notFirst = [number boolValue];
    if (notFirst) {
        NSDictionary *dic = @{@"notFirst":@YES};
        [dic writeToFile:filePath atomically:YES];
        GuideViewController *vc = [[GuideViewController alloc] init];
        self.window.rootViewController = vc;
    } else {
        MainTabBarController *vc = [[MainTabBarController alloc] init];
        self.window.rootViewController = vc;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
