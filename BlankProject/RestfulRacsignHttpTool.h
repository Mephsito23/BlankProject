//
//  RestfulRacsignHttpTool.h
//  ACGPicture
//
//  Created by mac on 2018/1/24.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCBaseRequest;
@interface RestfulRacsignHttpTool : NSObject

+ (RACSignal *)getHttpWith:(NSString *)urlStr
             parameter:(NSDictionary *)parameter
         headParameter:(NSDictionary *)headParameter;

+ (RACSignal *)httpWithRequest:(LCBaseRequest *)client;


@end
