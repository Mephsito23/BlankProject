//
//  NSDate+Compare.h
//  Oilb2B_iOS
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Compare)

/**
 比较两个时间

 @param oneDay  oneDay
 @param anotherDay anotherDay
 @return @YES oneDay>anotherDay @NO oneDay <= anotherDay
 */
+(BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;


/**
 比较两个时间

 @param oneDay  oneDay
 @param anotherDay anotherDay
 @return -1: oneDay < anotherDay 0:等于 1:oneDay > anotherDay
 */
+(NSInteger)compareInfoOneDate:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

/**
 已知时间与另一个时间比较

 @param date 比较的时间
 @return @YES 大于 @NO 小于或者等于
 */
- (BOOL)xz_compareWithDate:(NSDate *)date;


- (NSComparisonResult)xz_compareWithAnother:(NSDate *)date;

@end
