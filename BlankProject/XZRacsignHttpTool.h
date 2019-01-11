//
//  XZRacsignHttpTool.h
//  TeYouDian
//
//  Created by mac on 17/3/28.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseClientModel.h"
#import "Enum.h"

@class LCBaseRequest;
@interface XZRacsignHttpTool : NSObject


/**
 发送网络请求
 
 @param client 请求模型
 @return 返回一个信号
 */
+ (RACSignal *)httpWithRequest:(LCBaseRequest *)client;

+ (RACSignal *)httpWithRequest:(NSString *)url
                     parameter:(NSDictionary *)parameter
                 headParameter:(NSDictionary *)headParameter;

@end
