//
//  RegisterViewModel.h
//  Randomer
//
//  Created by 王子轩 on 16/4/10.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseViewModel.h"

@interface RegisterViewModel : BaseViewModel

/** 请求验证码 */
- (void)requestSmsCodeWithmobilePhoneNumber:(NSString *)phoneNum success:(Success)success failure:(Failure)failure error:(Error)errorBlock;
/** 注册 */
- (void)registerWithNum:(NSString *)num smscode:(NSString *)smscode password:(NSString *)password success:(Success)success failure:(Failure)failure error:(Error)errorBlock;
/** 注册 */
- (void)registerWithNum:(NSString *)num password:(NSString *)password success:(Success)success failure:(Failure)failure error:(Error)errorBlock;
/** 请求重置验证码 */
- (void)requestPasswordResetBySmsCodeWithmobilePhoneNumber:(NSString *)phoneNum success:(Success)success failure:(Failure)failure error:(Error)errorBlock;
/** 请求重置 */
- (void)resetPasswordBySmsCode:(NSString *)code password:(NSString *)password  success:(Success)success failure:(Failure)failure error:(Error)errorBlock;
/** 请求重置 */
- (void)resetPasswordWithPhoneNumber:(NSString *)phoneNum smsCode:(NSString *)code password:(NSString *)password  success:(Success)success failure:(Failure)failure error:(Error)errorBlock;
@end
