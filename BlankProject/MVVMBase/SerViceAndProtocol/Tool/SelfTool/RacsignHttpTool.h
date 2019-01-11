//
//  RacsignHttpTool.h
//  TVRecharge
//
//  Created by mac on 17/3/9.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^errorDeal)(id rbj);

@interface RacsignHttpTool : NSObject

@property (nonatomic, copy)errorDeal errorD;


/**检查网络状态*/
+ (RACSignal *)checkNetWorkStateRacsignal;

/**
 发送网络请求 post

 @param urlStr url
 @param params  传入参数

 @return 返回一个成功或者失败的信号
 */
+ (RACSignal *)post2racWthURL:(NSString *)urlStr
                       params:(NSDictionary *)params;


+ (RACSignal *)post2racWthURL:(NSString *)urlStr
                   headParams:(NSDictionary *)headParams
                       params:(NSDictionary *)params;



+ (RACSignal *)post2racWthURL:(NSString *)urlStr
                       params:(NSDictionary *)params
                     imageArr:(NSArray *)imageArr
                  isSingleImage:(BOOL)isSingleImage;


@end
