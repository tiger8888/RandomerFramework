//
//  LoginView.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseView.h"
#import "LoginViewModel.h"
@interface LoginView : BaseView



@property(nonatomic,strong)LoginViewModel * viewModel;
@property(nonatomic,strong)BaseTextField * usernameTextField;
@property(nonatomic,strong)BaseTextField * passwordTextField;
@property(nonatomic,strong)UIButton * loginBtn;
@property(nonatomic,strong)UIButton * forgetBtn;
@property(nonatomic,strong)UIButton * registerBtn;
@end
