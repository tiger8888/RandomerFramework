//
//  BaseViewControllerProtocol.h
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewProtocol;

@protocol BaseViewControllerProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id<BaseViewProtocol>)viewModel;

- (void)wzx_bindViewModel;
- (void)wzx_addSubviews;
- (void)wzx_layoutNavigation;
- (void)wzx_getNewData;
- (void)recoverKeyboard;
@end
