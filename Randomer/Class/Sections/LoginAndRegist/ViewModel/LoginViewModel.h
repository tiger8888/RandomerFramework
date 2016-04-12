//
//  LoginViewModel.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseViewModel.h"
#import "RegisterViewController.h"
@interface LoginViewModel : BaseViewModel<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>


- (void)loginWithUserName:(NSString *)username password:(NSString *)password Success:(Success)success failure:(Failure)failure error:(Error)errorBlock;

- (void)toRegisterWithType:(Type)type ;

- (void)toMain;
@end
