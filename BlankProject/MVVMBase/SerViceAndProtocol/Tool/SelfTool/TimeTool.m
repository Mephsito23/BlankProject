//
//  TimeTool.m
//  TVRecharge
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "TimeTool.h"

@implementation TimeTool


+(NSDate *)getCurrentTimeWithTimeFormat:(NSString *)timeFormate;
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:timeFormate];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    NSLog(@"---------- currentDate == %@",date);
    return date;
}

+(NSString*)getCurrentDateWithFormat:(NSString *)format{
    //获得系统时间
    NSDate * senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSString * locationTime=[dateformatter stringFromDate:senddate];
    
    return locationTime;
}


+(BOOL)compareTimeWtiFirstTime:(NSString *)firstTime
                       twoTime:(NSString *)twoTime
                    timeFormat:(NSString *)timeFormat{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:timeFormat];
    NSDate *timeOne = [formatter dateFromString:firstTime];
    NSDate *timeTwo = [formatter dateFromString:twoTime];
    
    NSCalendar*calendar=[NSCalendar currentCalendar];
    NSDateComponents*cmps=[calendar components:NSCalendarUnitMinute fromDate:timeOne toDate:timeTwo options:NSCalendarMatchStrictly];
    
    NSLog(@"%ld",cmps.minute);
    return (cmps.minute>0)?YES:NO;
    
}

@end
