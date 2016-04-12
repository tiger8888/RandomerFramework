//
//  BaseViewProtocol.h
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)wzx_bindViewModel;
- (void)wzx_setupViews;
- (void)wzx_addReturnKeyBoard;

@end
