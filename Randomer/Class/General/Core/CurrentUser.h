//
//  CurrentUser.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"
@interface CurrentUser : NSObject
@property(nonatomic,strong)PersonModel * model;

+ (CurrentUser *)user;

- (void)setSex:(BOOL)sex;
- (void)setNickName:(NSString *)nickName;
- (void)setBirthDay:(NSDate *)birthday;
@end
