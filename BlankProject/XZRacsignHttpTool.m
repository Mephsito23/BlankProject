//
//  XZRacsignHttpTool.m
//  TeYouDian
//
//  Created by mac on 17/3/28.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "XZRacsignHttpTool.h"
#import "RestfulRacsignHttpTool.h"
#import <LCNetwork/LCNetwork.h>


@implementation XZRacsignHttpTool

static void (^doNext)(id responseObject)=^(id responseObject){
    
};

static void (^doError)(NSError * _Nonnull error)=^(NSError * _Nonnull error){
    
};

+ (RACSignal *)httpWithRequest:(LCBaseRequest *)client {
    
    return [[[[RestfulRacsignHttpTool httpWithRequest:client]
              doNext:doNext]
             doError:doError] replayLazily];
}

+ (RACSignal *)httpWithRequest:(NSString *)url
                     parameter:(NSDictionary *)parameter
                 headParameter:(NSDictionary *)headParameter {
    
    return [[RestfulRacsignHttpTool getHttpWith:url
                                      parameter:parameter
                                  headParameter:headParameter] replayLazily];
}


@end
