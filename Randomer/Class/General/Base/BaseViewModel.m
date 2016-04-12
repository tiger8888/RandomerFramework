//
//  BaseModel.m
//  Randomer
//
//  Created by 王子轩 on 16/4/8.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

@synthesize request = _request;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel * viewModel = [super allocWithZone:zone];
    if (viewModel) {
        
        [viewModel wzx_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NetworkRequest *)request {
    if (!_request) {
        _request = [NetworkRequest Request];
    }
    return _request;
}

#pragma mark -- RAC --
//进行一些逻辑绑定，网络数据请求处理
- (void)wzx_initialize {}
@end
