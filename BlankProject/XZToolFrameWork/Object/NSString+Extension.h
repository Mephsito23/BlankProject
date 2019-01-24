//
//  NSString+Extension.h
//  Oilb2B_iOS
//
//  Created by mac on 2018/12/19.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (BOOL)isPhoneNumber;

- (BOOL)isPSW;

- (BOOL)isIPAddress;

/**
 获取一个随机字符串
 
 @param length 随机字符串长度
 @return 返回结果
 */
+ (NSString *)strWithRandomStrWith:(NSInteger)length;

/**
 获取汉字拼音首字母或者字母首字母
 */
- (NSString *)firstLetter;


#pragma mark  - 验证类
/**
 判断身份证是否合法
 
 @return 返回是否合法Yes 合法, No不合法
 */
- (BOOL)isIdentityStringValid;


/**
 正则判断手机号码地址格式
 
 @return YES 合法 NO不合法
 */
- (BOOL)isMobileNumber;

/**
 正则判断邮箱格式
 
 @return YES 合法 NO不合法
 */
- (BOOL)isValidateEmail;

/**
 正则判断车牌号格式
 
 @return YES 合法 NO不合法
 */
- (BOOL)isValidateCarNumber;

@end
