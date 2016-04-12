//
//  NetworkRequest.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest

+ (NetworkRequest *)Request {
    static NetworkRequest * request = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        request = [NetworkRequest manager];
    });
    return request;
}


- (void)request:(NSString *)url Type:(RequestType)type parameters:(id)parameters success:(Success)successBlock error:(Error)errorBlock {
    NetworkRequest * request = [NetworkRequest Request];
    switch (type) {
        case GET:{
            [NetworkRequest Request].requestSerializer = [AFHTTPRequestSerializer serializer];
            [self setHTTPHeader];
         [request GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             successBlock(responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             errorBlock(error);
         }];
        }
            break;
        case POST:{
             [NetworkRequest Request].requestSerializer = [AFJSONRequestSerializer serializer];
            [self setHTTPHeader];
            [request POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                errorBlock(error);
            }];
        }
            break;
        case PATCH:{
            [self setHTTPHeader];
        }
            break;
        case PUT:{
            [self setHTTPHeader];
            [request PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 errorBlock(error);
            }];
        }
            break;
        case DELETE:{
            [self setHTTPHeader];
        }
            break;
        default:
            break;
    }
}

- (void)setHTTPHeader {
    [[NetworkRequest Request].requestSerializer setValue:X_LC_Id forHTTPHeaderField:@"X-LC-Id"];
    [[NetworkRequest Request].requestSerializer setValue:X_LC_Key forHTTPHeaderField:@"X-LC-Key"];
    [[NetworkRequest Request].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}
@end
