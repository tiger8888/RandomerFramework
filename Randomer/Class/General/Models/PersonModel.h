//
//  PersonModel.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

@property(nonatomic,copy)NSString * nickName;

@property(nonatomic,assign)BOOL sex;

@property(nonatomic,copy)NSDate * birthday;
@end
