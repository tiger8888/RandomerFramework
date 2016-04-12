//
//  RegisterView.h
//  Randomer
//
//  Created by 王子轩 on 16/4/10.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseView.h"
#import "RegisterViewModel.h"
@interface RegisterView : BaseView
typedef NS_ENUM(NSInteger,Type) {
    Register,
    Forget
};
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel andType:(Type)type;
@property (nonatomic,assign)Type type;
@property(nonatomic,strong)RegisterViewModel * viewModel;
@property(nonatomic,strong)BaseTextField * usernameTextField;
@property(nonatomic,strong)BaseTextField * passwordTextField;
@property(nonatomic,strong)BaseTextField * codeTextField;
@property(nonatomic,strong)UIButton * sendCodeBtn;
@property(nonatomic,strong)UIButton * registerBtn;


@property(nonatomic,assign)BOOL isSend;
@end
