    //
//  RacsignHttpTool.m
//  TVRecharge
//
//  Created by mac on 17/3/9.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "RacsignHttpTool.h"
#import <AFNetworking/AFNetworking.h>

@implementation RacsignHttpTool


static AFHTTPSessionManager *_mgr;

+ (AFHTTPSessionManager *)sharedHTTPOperationManager{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _mgr = [AFHTTPSessionManager manager];
        
        [_mgr.requestSerializer setTimeoutInterval:timeOut];
        
        _mgr.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    
    return _mgr;
}


/**
 *  转换成响应式请求 可重用
 *
 *  @param urlStr   请求地址
 *  @param params 请求参数
 *
 *  @return 带请求结果（字典）的信号
 */
+ (RACSignal *)post2racWthURL:(NSString *)urlStr params:(NSDictionary *)params{
    
    NSAssert(urlStr.length>0, @"传入 URL不能为空");
    NSAssert(params.count>0,@"传入参数不能为空");
    
   @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        
        NSURLSessionDataTask *operation=
        [self requentNewWorkWithUrl:urlStr
                             params:params
         headerFieldValueDictionary:nil
                       isUpLoadFiel:NO
                             isPost:YES
                      formDataBlock:nil
                           progress:nil
                       succeedBlock:^(id responseObject) {
                       @strongify(self);

                           [subscriber sendNext:responseObject];
                           [subscriber sendCompleted];
                           
                       } failBlock:^(NSError * _Nonnull error) {
                           
                           NSLog(@"%@",error);
                           [subscriber sendError:error];
                           [subscriber sendCompleted];
                       }];
        
        return [RACDisposable disposableWithBlock:^{
            [operation cancel];
        }];
    }];
    
}

+ (RACSignal *)post2racWthURL:(NSString *)urlStr
                   headParams:(NSDictionary *)headParams
                       params:(NSDictionary *)params{
    
    NSAssert(urlStr.length>0, @"传入 URL不能为空");
    NSAssert(params.count>0,@"传入参数不能为空");
    
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        
        NSURLSessionDataTask *operation=
        [self requentNewWorkWithUrl:urlStr
                             params:params
         headerFieldValueDictionary:headParams
                       isUpLoadFiel:NO
                             isPost:NO
                      formDataBlock:nil
                           progress:nil
                       succeedBlock:^(id responseObject) {
                        @strongify(self);

                           [subscriber sendNext:responseObject];
                           [subscriber sendCompleted];
                           
                       } failBlock:^(NSError * _Nonnull error) {
                           
                           NSLog(@"%@",error);
                           [subscriber sendError:error];
                           [subscriber sendCompleted];
                       }];
        
        return [RACDisposable disposableWithBlock:^{
            [operation cancel];
        }];
    }];
    
}


+ (RACSignal *)post2racWthURL:(NSString *)urlStr
                       params:(NSDictionary *)params
                     imageArr:(NSArray *)imageArr
                  isSingleImage:(BOOL)isSingleImage{
    
    NSAssert(urlStr.length>0, @"传入 URL不能为空");
    NSAssert(params.count>0,@"传入参数不能为空");
    
     @weakify(self);
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        
        NSURLSessionDataTask *operation=
        [self requentNewWorkWithUrl:urlStr
                             params:params
         headerFieldValueDictionary:nil
                       isUpLoadFiel:YES
                             isPost:YES
                      formDataBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                          //循环上传多张图片
                          if (isSingleImage==YES) {
                              [formData appendPartWithFileData:[imageArr lastObject]
                                                          name:@"image"
                                                      fileName:@"image"
                                                      mimeType:@"image/jpg"];
                          }else{
                              
                              for (int i = 0; i < imageArr.count; i++) {
                                  [formData appendPartWithFileData:imageArr[i]
                                                              name:[NSString stringWithFormat:@"image%d",i+1]
                                                          fileName:[NSString stringWithFormat:@"image%d",i+1]
                                                          mimeType:@"image/jpg"];
                              }
                          }
                          
                      } progress:^(NSProgress * uploadProgress){
                      }succeedBlock:^(id responseObject) {
                          
                          [subscriber sendNext:responseObject];
                          [subscriber sendCompleted];
                          
                      } failBlock:^(NSError * _Nonnull error) {
                          [subscriber sendError:error];
                          [subscriber sendCompleted];
                      }];
        
        return [RACDisposable disposableWithBlock:^{
            [operation cancel];
        }];
    }];
    
}

+ (RACSignal *)checkNetWorkStateRacsignal{

    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {

        //网络监控句柄
        AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
        //要监控网络连接状态，必须要先调用单例的startMonitoring方法
        [netManager startMonitoring];
        [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            //未知和未连接
            if (status==AFNetworkReachabilityStatusUnknown||
                status==AFNetworkReachabilityStatusNotReachable) {
                [SVProgressHUD showErrorWithStatus:@"连接失败,请检查网络连接"];
                [subscriber sendNext:@(NO)];
                [subscriber sendCompleted];
            }else{
                [subscriber sendNext:@(YES)];
                [subscriber sendCompleted];
            }
        }];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}

+ (NSURLSessionDataTask *)requentNewWorkWithUrl:(NSString *)urlStr
                                         params:(NSDictionary *)params
                     headerFieldValueDictionary:(NSDictionary *)headerFieldValueDictionary
                                   isUpLoadFiel:(BOOL)isUpLoadFiel
                                         isPost:(BOOL)isPost
                                  formDataBlock:(void(^)(id<AFMultipartFormData>  _Nonnull formData))formDataBlock
                                       progress:(nullable void (^)(NSProgress * uploadProgress))progress
                                   succeedBlock:(void(^)(id responseObj))succeedBlock
                                      failBlock:(void(^)(NSError  * _Nonnull error))failBlock{
    
    if ( isPost==YES) {
        AFHTTPSessionManager * manager =[RacsignHttpTool sharedHTTPOperationManager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
        if (isUpLoadFiel==NO) {
            NSURLSessionDataTask *operation=[manager POST:urlStr
                                               parameters:params
                                                 progress:nil
                                                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                      succeedBlock(responseObject);
                                                  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                      failBlock(error);
                                                  }];
            return operation;
        }else{
            
            NSURLSessionDataTask *operation=[manager POST:urlStr
                                               parameters:params
                                constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                                    formDataBlock(formData);
                                    
                                } progress:^(NSProgress * _Nonnull uploadProgress) {
                                    progress(uploadProgress);
                                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    succeedBlock(responseObject);
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    failBlock(error);
                                }];
            return operation;
        }
        
    }else{
        
        AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];

        if (headerFieldValueDictionary != nil) {
            AFHTTPRequestSerializer *requestSerializer =  [AFJSONRequestSerializer serializer];
            for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
                NSString *value = headerFieldValueDictionary[httpHeaderField];
                [requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
            }
            manager.requestSerializer = requestSerializer;
        }else{
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
        }
            NSURLSessionDataTask *operation=[manager GET:urlStr
                                              parameters:params
                                                progress:nil
                                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                     succeedBlock(responseObject);
                                                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                     failBlock(error);
                                                 }];
            return operation;
    }
}

@end
