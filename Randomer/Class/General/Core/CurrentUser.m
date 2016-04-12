//
//  CurrentUser.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "CurrentUser.h"

@implementation CurrentUser

+ (CurrentUser *)user {
    static CurrentUser * user = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        user = [[CurrentUser alloc]init];
    });
    return user;
}

- (void)setBirthDay:(NSDate *)birthday {
    self.model.birthday = birthday;
}

- (void)setSex:(BOOL)sex {
    self.model.sex = sex;
}

- (void)setNickName:(NSString *)nickName {
    self.model.nickName = nickName;
}
@end
