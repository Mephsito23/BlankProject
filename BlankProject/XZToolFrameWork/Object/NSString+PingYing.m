//
//  NSString+PingYing.m
//  Transportation
//
//  Created by mac on 2018/4/2.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSString+PingYing.h"
#import "NSMutableArray+JsonArray.h"


@implementation NSString (PingYing)

- (NSString *)getPingYing {
    
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    NSString *pinyinString = [mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    pinyinString = [pinyinString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return pinyinString;
}

+ (NSString *)getFirstLetterFromString:(NSString *)aString{
    
    NSMutableString *mutableString = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    NSString *pinyinString = [mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    
    // 将拼音首字母装换成大写
    NSString *strPinYin = [[self polyphoneStringHandle:aString pinyinString:pinyinString] uppercaseString];
    // 截取大写首字母
    NSString *firstString = [strPinYin substringToIndex:1];
    // 判断姓名首位是否为大写字母
    NSString * regexA = @"^[A-Z]$";
    NSPredicate *predA = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexA];
    // 获取并返回首字母
    return [predA evaluateWithObject:firstString] ? firstString : @"#";
}

/**
 多音字处理
 */
+ (NSString *)polyphoneStringHandle:(NSString *)aString pinyinString:(NSString *)pinyinString
{
    if ([aString hasPrefix:@"长"]) { return @"chang";}
    if ([aString hasPrefix:@"沈"]) { return @"shen"; }
    if ([aString hasPrefix:@"厦"]) { return @"xia";  }
    if ([aString hasPrefix:@"地"]) { return @"di";   }
    if ([aString hasPrefix:@"重"]) { return @"chong";}
    return pinyinString;
}

@end
