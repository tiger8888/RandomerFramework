//
//  PreViewModel.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "PreViewModel.h"
#import "KeyChain.h"
#import "LoginViewController.h"
#import "LoginViewModel.h"

@implementation PreViewModel

- (RACSignal *)autoLoginJudgeSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSDictionary * dic = [KeyChain load:KEY_USERNAME_PASSWORD];
        [subscriber sendNext:@(dic[KEY_PASSWORD]&&dic[KEY_USERNAME])];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)autoLoginSignal {
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        [self autoLoginWithSuccess:^(id response) {
            [subscriber sendNext:response];
        } failure:^{
            [subscriber sendError:nil];
        } error:^(NSError *error) {
            [subscriber sendError:error];
        }];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (void)autoLoginWithSuccess:(Success)success failure:(Failure)failure error:(Error)errorBlock {
    NSDictionary * dic =[KeyChain load:KEY_USERNAME_PASSWORD];
    [[[LoginViewModel alloc]init]loginWithUserName:dic[KEY_USERNAME] password:dic[KEY_PASSWORD] Success:^(id response) {
        success(response);
    } failure:^{
        failure(nil);
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}
@end
