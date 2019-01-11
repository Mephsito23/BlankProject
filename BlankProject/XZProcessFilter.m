//
//  XZProcessFilter.m
//  Transportation
//
//  Created by mac on 2018/5/8.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <LCNetwork/LCBaseRequest.h>
#import "XZProcessFilter.h"
#import "NSString+PingYing.h"


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
    return @{};
}



@end
