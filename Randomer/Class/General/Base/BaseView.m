//
//  BaseView.m
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self wzx_setupViews];
        [self wzx_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<BaseViewProtocol>)viewModel {
    self = [super init];
    if (self) {
        [self wzx_setupViews];
        [self wzx_bindViewModel];
    }
    return self;
}

#pragma mark -- RAC --
//绑定V与VM
- (void)wzx_bindViewModel {}

//添加子View到主View
- (void)wzx_setupViews {}

//设置点击空白键盘回收
- (void)wzx_addReturnKeyBoard {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}
@end
