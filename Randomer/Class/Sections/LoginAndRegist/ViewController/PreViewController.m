//
//  PreViewController.m
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "PreViewController.h"
#import "PreViewModel.h"
#import "PreView.h"
#import "LoginViewController.h"
#import "RegisterViewModel.h"
@interface PreViewController ()
@property (nonatomic,strong)PreView * mainView;
@property (nonatomic,strong)PreViewModel * viewModel;
@end
@implementation PreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)updateViewConstraints {
    
    WS(weakSelf)
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [super updateViewConstraints];
}

#pragma mark -- private
- (void)wzx_addSubviews {
   [self.view addSubview:self.mainView];
   [self.view setNeedsUpdateConstraints];
   [self.view updateConstraintsIfNeeded];
}

- (void)wzx_bindViewModel {
    @weakify(self)
    [[self.viewModel.autoLoginJudgeSignal delay:0] subscribeNext:^(NSNumber *  canLogin) {
        NSLog(@"%@",canLogin);
        @strongify(self)
        if ([canLogin boolValue]&&0) {
//            [self.viewModel.autoLoginSignal subscribeNext:^(id response) {
//                
//            } error:^(NSError *error) {
//                NSLog(@"自动登录失败");
//            }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                self.view.alpha = 0.7;
                
            }completion:^(BOOL finished) {
                
                [UIApplication sharedApplication].keyWindow.rootViewController = [[LoginViewController alloc]init];
            }];
        }
        
    } error:^(NSError *error) {
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [SVProgressHUD show];
}

- (PreView *)mainView
{
    if (!_mainView) {
        _mainView = [[PreView alloc]initWithViewModel:self.viewModel];
    }
    return _mainView;
}

- (PreViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PreViewModel alloc]init];
    }
    return _viewModel;
}
@end
