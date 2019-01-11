//
//  NSArray+ImageStrToImageArr.m
//  Transportation
//
//  Created by mac on 2018/4/10.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSArray+ImageStrToImageArr.h"

@implementation NSArray (ImageStrToImageArr)

+ (NSArray *)xz_arrWithImageStr:(NSString *)imageStr {
    
    imageStr = [imageStr stringByReplacingOccurrencesOfString:@"[" withString:@""];
    imageStr = [imageStr stringByReplacingOccurrencesOfString:@"]" withString:@""];
    imageStr = [imageStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    imageStr = [imageStr stringByReplacingOccurrencesOfString:@"'" withString:@""];
    
    NSArray *arr = [imageStr componentsSeparatedByString:@","];

    return (arr == nil) ? @[] : arr;
}

- (NSString *)xz_jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSString *temp = [json stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        if (!error) return temp;
    }
    return nil;
}



@end
