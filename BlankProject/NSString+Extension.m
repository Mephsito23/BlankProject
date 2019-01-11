//
//  NSString+Extension.m
//  Oilb2B_iOS
//
//  Created by mac on 2018/12/19.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (BOOL)match:(NSString *)pattern {
    // 1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    // 2.测试字符串
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count > 0;
}

- (BOOL)isPhoneNumber {
    // 1.全部是数字
    // 2.11位
    // 3.以13\15\18\17开头 后台已检测
    return [self match:@"^1\\d{10}$"];
    //    return [self match:@"^(13\\d|14[57]|15[^4,\\D]|17[678]|18\\d)\\d{8}$|^170[059]\\d{7}$"];
}

- (BOOL)isPSW {
    
    // 以字母开头，长度在6~18之间，只能包含字符、数字和下划线
    return [self match:@"^[a-zA-Z0-9]{6,20}$"];
//    return [self match:@"[a-zA-Z]\\w{5,21}$"];
}

- (BOOL)isIPAddress {
    // 1-3个数字: 0-255
    // 1-3个数字.1-3个数字.1-3个数字.1-3个数字
    return [self match:@"^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$"];
}

@end
