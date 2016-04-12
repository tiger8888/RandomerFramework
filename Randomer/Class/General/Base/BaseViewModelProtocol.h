//
//  BaseViewModelProtocol.h
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NetworkRequest;

typedef enum :NSUInteger{
    WZXRefresh_HasMoreData = 1,
    WZXRefresh_HasNoMoreData,
    WZXRefreshError
}WZXRefreshDataStatus;

@protocol BaseViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;

@property(strong,nonatomic)NetworkRequest * request;

- (void)wzx_initialize;
@end
