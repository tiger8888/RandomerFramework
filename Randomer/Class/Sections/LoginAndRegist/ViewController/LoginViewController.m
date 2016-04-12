//
//  LoginViewController.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"
#import "MainViewContrller.h"
#import "CubeAnimation.h"
@interface LoginViewController()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic,strong)LoginView * mainView;
@property (nonatomic,strong)LoginViewModel * viewModel;
@property (nonatomic,strong)UIImageView * backgroundView;
@end
@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    self.view.alpha = 0.7;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)wzx_addSubviews {
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.mainView];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints {
    WS(weakSelf)
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    CGFloat top = [IPhoneSizeTool FloatWithiPhone6p:230 iPhone6:180 iPhone5:130 iPhone4:100];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(top);
        make.left.equalTo(weakSelf.view).offset(10);
        make.right.equalTo(weakSelf.view).offset(-10);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-10);
    }];
    [super updateViewConstraints];
}

- (void)wzx_bindViewModel {
    [self recoverKeyboard];
}

- (void)wzx_getNewData {

}

- (LoginView *)mainView {
    if (!_mainView) {
        _mainView = [[LoginView alloc]initWithViewModel:self.viewModel];
    }
    return _mainView;
}

- (LoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc]init];
    }
    return _viewModel;
}

- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [UIImageView new];
        _backgroundView.image = [UIImage imageWithContentsOfFile:FilePATH(@"base_map", @"jpg")];
    }
    return _backgroundView;
}

@end
