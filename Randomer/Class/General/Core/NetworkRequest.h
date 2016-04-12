//
//  NetworkRequest.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetworkRequest : AFHTTPSessionManager
typedef NS_ENUM(NSInteger,RequestType){
    GET,
    POST,
    PUT,
    PATCH,
    DELETE
};
+ (NetworkRequest *)Request;

- (void)request:(NSString *)url Type:(RequestType)type parameters:(id)parameters success:(Success)successBlock error:(Error)errorBlock;
@end
