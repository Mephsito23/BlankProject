//
//  NSObject+Tool.h
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OrderbyProtocol;
@interface NSObject (Tool)
/**
 将一个模型转换为字典
 
 @param object 传入要转换的模型
 
 @return 结果字典
 */
+ (NSDictionary *)getDictWithClass:(NSObject *)object;

/**
 四舍五入
 
 @param number 保留的小数位数
 @param doble  要四舍五入值
 
 @return 返回结果
 */
+ (NSString *) decimalwithFormat:(NSInteger )number
                           doble:(double)doble;

#pragma mark  - 排序

/**
 对传入的数组按照 A~Z进行排序
 
 @param listArr 需要排序的数组
 
 @return  返回排序数组
 */
+ (NSArray *)getOrderbyListWithArr:(NSArray <OrderbyProtocol>*)listArr;


/**
 获取字符串首字母
 
 @param aString 需要获取首字母的字符串
 
 @return 返回首字母
 */
+ (NSString *)getFirstLetterFromString:(NSString *)aString;

#pragma mark  - 验证类

/**
 判断身份证是否合法
 
 @param identityString 输入的身份证
 
 @return 返回是否合法Yes 合法, No不合法
 */
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;


/**
 正则判断手机号码地址格式
 
 @param mobileNum 输入的手机号
 
 @return 返回结果
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;


/**
 判断邮箱是否合法
 
 @param email 输入需要判断的邮箱
 
 @return 返回结果
 */
+ (BOOL) validateEmail:(NSString *)email;


/**
 判断输入的车牌是否合法
 
 @param carNo 输入的车牌
 
 @return 返回结果
 */
+ (BOOL) validateCarNo:(NSString *)carNo;






@end

#pragma mark  - 排序协议
@protocol OrderbyProtocol<NSObject>
//用于排序
- (NSString *)getListName;

@end



