//
//  BaseViewController.m
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController()
@end
@implementation BaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController * viewController = [super allocWithZone:zone];
    @weakify(viewController)
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)]subscribeNext:^(id x){
        
        @strongify(viewController);
        [viewController wzx_layoutNavigation];
        [viewController wzx_getNewData];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewDidLoad)]subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController wzx_addSubviews];
        [viewController wzx_bindViewModel];
    }];
    
    
    
    return viewController;
}

- (instancetype)initWithViewModel:(id<BaseViewControllerProtocol>)viewModel {
    self = [super init];
    if (self){
    }
    return self;
}

#pragma mark -- RAC --
//添加View到ViewController
- (void)wzx_addSubviews {}

//用来绑定V(VC)与VM
- (void)wzx_bindViewModel {}

//初次获取数据的时候调用（不是特别必要）
- (void)wzx_getNewData {}

//设置导航栏、分栏
- (void)wzx_layoutNavigation {}

- (void)recoverKeyboard {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    }];
    [self.view addGestureRecognizer:tap];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
