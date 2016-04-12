//
//  LoginView.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "LoginView.h"
@implementation LoginView

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self.viewModel = (LoginViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)updateConstraints {
    WS(weakSelf)
    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.equalTo(@(50));
    }];

    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_usernameTextField.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.height.equalTo(_usernameTextField);
    }];
    
    [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextField.mas_bottom).offset(10);
        make.right.equalTo(_passwordTextField.mas_right);
        make.height.equalTo(@(15));
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_forgetBtn.mas_bottom).offset(30);
        make.left.equalTo(weakSelf).offset(50);
        make.right.equalTo(weakSelf).offset(-50);
        make.height.equalTo(@(50));
    }];

    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf).offset(-10);
        make.centerX.equalTo(weakSelf);
        make.height.equalTo(@(20));
    }];
    [super updateConstraints];
}

- (void)wzx_setupViews {
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.loginBtn];
    [self addSubview:self.registerBtn];
    [self addSubview:self.forgetBtn];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)wzx_bindViewModel {
    [self wzx_addReturnKeyBoard];
    @weakify(self)
    RACSignal * validNameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];
    RACSignal * validPassSignal = [self.passwordTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];
    
    RAC(_loginBtn,enabled) = [RACSignal combineLatest:@[validNameSignal,validPassSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
        BOOL valid = [usernameValid boolValue]&&[passwordValid boolValue];
        _loginBtn.alpha = valid ? 1: 0.8;
       return @(valid);
    }];
    
    
    if ([IPhoneSizeTool lessThan:VersioniPhone6]) {
        [[[[NSNotificationCenter defaultCenter]rac_addObserverForName:UIKeyboardWillHideNotification object:nil] distinctUntilChanged]subscribeNext:^(id x) {
            NSLog(@"消失");
        }];
        
        [[[[NSNotificationCenter defaultCenter]rac_addObserverForName:UIKeyboardWillShowNotification object:nil] distinctUntilChanged]subscribeNext:^(id x) {
            NSLog(@"弹出");
        }];
    }
    

    
    [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel toRegisterWithType:Register];
    }];
    
    
    [[_forgetBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
       @strongify(self)
        [self.viewModel toRegisterWithType:Forget];
    }];

    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [SVProgressHUD show];
        [self.viewModel loginWithUserName:self.usernameTextField.text password:self.usernameTextField.text Success:^(id response) {
            [SVProgressHUD dismiss];
            [self.viewModel toMain];
        } failure:^{
            SHOW_ERROR(@"错误", @"账号或密码错误")
            [SVProgressHUD dismiss];
        } error:^(NSError *error) {
            NSLog(@"%@",error.localizedDescription);
            NSLog(@"%@",error.localizedFailureReason);
            SHOW_ERROR(@"错误", @"网络连接失败")
            [SVProgressHUD dismiss];
        }];
    }];
}

- (BaseTextField *)usernameTextField {
    if (!_usernameTextField) {
        _usernameTextField = [BaseTextField new];
        _usernameTextField.placeholder = [Statics localizable:@"手机号"];
        _usernameTextField.tintColor = COLOR_BASE;
        _usernameTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    }
    return _usernameTextField;
}

- (BaseTextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [BaseTextField new];
        _passwordTextField.placeholder = [Statics localizable:@"密码"];
        _passwordTextField.tintColor = COLOR_BASE;
        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    }
    return _passwordTextField;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton new];
        [_loginBtn setTitle:[Statics localizable:@"登录"] forState:UIControlStateNormal];
         _loginBtn.backgroundColor = COLOR_BASE;
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton new];
        [_registerBtn setTitle:[Statics localizable:@"创建一个帐号"] forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    return _registerBtn;
}

- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [UIButton new];
        [_forgetBtn setTitle:[Statics localizable:@"忘记密码了？"] forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _forgetBtn;
}
@end
