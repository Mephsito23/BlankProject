//
//  XZProcessFilter.m
//  Transportation
//
//  Created by mac on 2018/5/8.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "LCBaseRequest.h"
#import "XZProcessFilter.h"


@interface XZProcessFilter ()

@property (nonatomic, strong) NSMutableDictionary *argument;

@end

@implementation XZProcessFilter

///可以在这里面统一添加新的字段
- (NSDictionary *)processArgumentWithRequest:(NSDictionary *)argument query:(NSDictionary *)queryArgument{
    return argument;
}

///统一添加头字段
- (NSDictionary *)requestHeaderValue {
    
    NSDictionary *dict = @{@"Accept-Version" : @"v1",
                           @"Authorization" : @"Client-ID 95ec55ac16c55d6f9146eed5c9ec00d97ae4f111f5d5b5efe1060ad857dddc6a"};
    return dict;
}



@end
