//
//  PreViewModel.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseViewModel.h"

@interface PreViewModel : BaseViewModel

- (RACSignal *)autoLoginJudgeSignal;

- (RACSignal *)autoLoginSignal;

@end
