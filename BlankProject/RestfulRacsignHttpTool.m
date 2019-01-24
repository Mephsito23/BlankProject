//
//  RestfulRacsignHttpTool.m
//  ACGPicture
//
//  Created by mac on 2018/1/24.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "RestfulRacsignHttpTool.h"
#import "LCNetwork.h"


@implementation RestfulRacsignHttpTool

+ (RACSignal *)httpWithRequest:(LCBaseRequest<LCAPIRequest> *)client {
    
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {

        [client startWithBlockSuccess:^(__kindof LCBaseRequest *request) {
            [subscriber sendNext:request.responseJSONObject];
            [subscriber sendCompleted];
            
        } failure:^(__kindof LCBaseRequest *request, NSError *error) {
            
            NSLog(@"=======error======> %@",error);
            NSLog(@"=======> errorMessate: %@\n=======> errorUrl: %@", request.errorMessage, request.urlString);
            
            NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
            NSLog(@"==============> errResponse ==== %@",errResponse);
            [SVProgressHUD showErrorWithStatus:kERRORTIPMESSAGE];
            
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [client stop];
        }];
    }] replayLazily];
}

+ (RACSignal *)getHttpWith:(NSString *)urlStr
                 parameter:(NSDictionary *)parameter
             headParameter:(NSDictionary *)headParameter {
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [headParameter enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
        
        NSURLSessionDataTask *task = [manager
                                      GET:urlStr
                               parameters:parameter progress:nil
                                  success:^(NSURLSessionDataTask * _Nonnull task,
                                            id  _Nullable responseObject) {
                 
                                  NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                                 [subscriber sendNext:result];
                                 [subscriber sendCompleted];
                 
                               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     [subscriber sendError:error];
                                     [subscriber sendCompleted];
                               }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}


@end
