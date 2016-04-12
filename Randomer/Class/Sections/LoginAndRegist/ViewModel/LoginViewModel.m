//
//  LoginViewModel.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "LoginViewModel.h"
#import "KeyChain.h"
#import "CubeAnimation.h"
#import "MainViewContrller.h"
@implementation LoginViewModel



- (void)loginWithUserName:(NSString *)username password:(NSString *)password Success:(Success)success failure:(Failure)failure error:(Error)errorBlock {
    NSDictionary * dic = @{
                         @"username": username,
                         @"password": password
                         };
    [[NetworkRequest Request]request:BASE_URL(@"login") Type:GET parameters:dic success:^(id response) {
        if (response[@"sessionToken"]) {
            [self saveCurrentUserWith:dic];
            success (response);
        }else {
            failure (nil);
        }
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}

- (void)toRegisterWithType:(Type)type {
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [appRootVC setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [appRootVC presentViewController:[[RegisterViewController alloc]initWithType:type] animated:YES completion:^{
        
    }];
}

- (void)saveCurrentUserWith:(NSDictionary *)dic {
    [KeyChain save:KEY_USERNAME_PASSWORD data:dic];
}

- (void)toMain{
    UIViewController * mainVC = [[MainViewContrller alloc]init];
    mainVC.transitioningDelegate = self;
    [[Statics appRootViewController] presentViewController:mainVC animated:YES completion:^{
        
    }];
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[CubeAnimation alloc]init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[CubeAnimation alloc]init];
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return nil;
}

@end
