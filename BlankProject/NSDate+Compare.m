//
//  NSDate+Compare.m
//  Oilb2B_iOS
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSDate+Compare.h"

@implementation NSDate (Compare)

+(BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"dd-MM-yyyy"];

    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];

    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];

    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];

    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];

    NSComparisonResult result = [dateA compare:dateB];
    

    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay比 anotherDay时间晚");
        return YES;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay比 anotherDay时间早");
        return NO;
    }
    //NSLog(@"两者时间是同一个时间");
    return NO;
}

+(NSInteger)compareInfoOneDate:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay比 anotherDay时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay比 anotherDay时间早");
        return -1;
    }
    //NSLog(@"两者时间是同一个时间");
    return 0;
    
}


- (BOOL)xz_compareWithDate:(NSDate *)date {
    return [NSDate compareOneDay:self withAnotherDay:date];
}

- (NSComparisonResult)xz_compareWithAnother:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:self];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:date];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    return result;
    
}

@end
