//
//  NSDictionary+ToJson.m
//  Randomer
//
//  Created by 王子轩 on 16/4/10.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "NSDictionary+ToJson.h"

@implementation NSDictionary (ToJson)

- (NSJSONSerialization *)toJson {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}
@end
