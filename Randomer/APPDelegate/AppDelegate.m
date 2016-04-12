//
//  AppDelegate.m
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "AppDelegate.h"
#import "ThirdPartService.h"
#import "EMSDK.h"

#import "PreViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.bounds = [UIScreen mainScreen].bounds;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];

    self.window.rootViewController = [[PreViewController alloc]init];
    return YES;
}

- (void)initEM
{
    //AppKey:注册的appKey，详细见下面注释。
    //apnsCertName:推送证书名(不需要加后缀)，详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"wzx#randomer16"];
    //options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//App进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
     [[EMClient sharedClient] applicationDidEnterBackground:application];
}

//App进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
     [[EMClient sharedClient] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
