//
//  NSMutableArray+JsonArray.m
//  Transportation
//
//  Created by mac on 2018/4/19.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSMutableArray+JsonArray.h"

@implementation NSMutableArray (JsonArray)

+ (NSMutableArray *)xz_arrayWithJsonArray:(NSString *)jsonArr {
    
    jsonArr = [jsonArr stringByReplacingOccurrencesOfString:@"[" withString:@""];
    jsonArr = [jsonArr stringByReplacingOccurrencesOfString:@"]" withString:@""];
    jsonArr = [jsonArr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    jsonArr = [jsonArr stringByReplacingOccurrencesOfString:@"'" withString:@""];
    
    NSArray *arr = [jsonArr componentsSeparatedByString:@","];
    return [NSMutableArray arrayWithArray:arr];
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
