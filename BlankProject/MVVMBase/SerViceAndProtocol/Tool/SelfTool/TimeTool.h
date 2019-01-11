//
//  TimeTool.h
//  TVRecharge
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeTool : NSObject

/**
 比较两个时间大小
 
 @param firstTime  输入的第一个时间
 @param twoTime    第二个时间
 @param timeFormat 时间格式
 
 @return 返回的结果
 */
+(BOOL)compareTimeWtiFirstTime:(NSString *)firstTime
                       twoTime:(NSString *)twoTime
                    timeFormat:(NSString *)timeFormat;


/**
 获取当前时间

 @param timeFormate 传入时间格式

 @return 返回 NSDete 的当前时间
 */
+(NSDate *)getCurrentTimeWithTimeFormat:(NSString *)timeFormate;


/**
 获取当前时间
 
 @param format 传入时间格式
 
 @return 返回 NSString 的当前时间
 */
+(NSString*)getCurrentDateWithFormat:(NSString *)format;

@end
