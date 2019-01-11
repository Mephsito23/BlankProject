//
//  ToolWithOther.h
//  IDCardValidation
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YTKKeyValueStore/YTKKeyValueStore.h>

@protocol OrderbyProtocol;
@interface ToolWithOther : NSObject

/**
 获取一个随机字符串
 @param length 字符串长度
 @return 返回结果
 */
+ (NSString *)getRandomStrWith:(NSInteger)length;

/**
 获取一个10位长度的随机字符串
 @return 返回结果
 */
+ (NSString *)getRandomStr;

#pragma mark  - other

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


#pragma mark  - 时间相关
/**
 根据数字返回文字星期
 
 @param weakTeger 1-7的星期数字
 
 @return 返回文字星期几
 */
+(NSString *)getWeekDayWithNSInteger:(NSInteger)weakTeger;

/**
 返回友好的时间
 
 @param date      时间
 @param isTwoFour 是否24小时制
 
 @return 返回的时间
 */
+(NSString *)getTimeWithDate:(NSDate *)date
                   isTwoFour:(BOOL)isTwoFour;
    
#pragma mark  - 数据存储

/**
 YTK保存

 @param tableName 表名称
 @param key       键值
 @param object    对象
 */
+ (void)saveDataWithYTK:(NSString *)tableName
                    key:(NSString *)key
                 object:(NSObject<NSCoding> *)object;


/**
  YTK 根据键值取出数据

 @param tableName 表名称
 @param key       键值

 @return 要取出的对象
 */
+ (id)getDataWithYTK:(NSString *)tableName
                 key:(NSString *)key;


/**
  YTK 取出表内的所有对象

 @param tableName 表名称

 @return 所有的对象
 */
+ (NSArray *)getAllDataWithYTK:(NSString *)tableName;

/**
 保存数据

 @param tableName 保存的表名
 @param key     保存的 key 值
 @param dict      要保存的字典
 */
+ (void)saveDataWithTableName:(NSString *)tableName
                          key:(NSString *)key
                         dict:(NSDictionary *)dict;


/**
 保存数据
 
 @param tableName 保存的表名
 @param key     保存的 key 值
 @param object    实现 NSCoding协议的对象
 */
+ (void)saveDataWithTableName:(NSString *)tableName
                          key:(NSString *)key
                       object:(NSObject<NSCoding> *)object;

/**
 获取数据

 @param tableName 保存的表名
 @param key       保存的 key

 @return 返回的数据
 */
+ (id)getDataWithTableName:(NSString *)tableName
                       key:(NSString *)key;


/**
  删除数据

 @param tableName 要删除的表名
 @param key       要删除的 key值
 */
+ (void)deleDataWithTableName:(NSString *)tableName
                          key:(NSString *)key;

+ (void)deleDataWithYTK:(NSString *)tableName
                    key:(NSString *)key;


 #pragma mark  - 图片相关
/**
 颜色转图片
 
 @param color 需要生成图片的颜色
 
 @return 返回的颜色图片
 */
+(UIImage*) createImageWithColor:(UIColor*) color;


/**
 压缩图片
 
 @param image 要压缩的图片
 @param asize 压缩的大小
 
 @return 返回压缩后的图片
 */
+ (UIImage *)reglualScaleToSize:(UIImage *)image size:(CGSize)asize;



/**
 打开相机判断
 
 @return 返回判断结果
 */
+ (BOOL)isCameraCanOpen;

///打开相机
+(UIImagePickerController *)openTakePhoto:(id<UIImagePickerControllerDelegate>)delegate;


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

/**
 判断定位权限是否开启

 @return 返回结果
 */
+ (BOOL)LocationPermissionsIsOpen;

/**
 
 获取日志路径
 
 @return 返回结果
 */

+ (NSString *)redirectNSlogToDocumentFolder;


/**
 应用是否打开了了通知
 @return YES 允许  NO 不允许
 */
+ (BOOL)isCanOpenNotifiction;

@end


#pragma mark  - 排序协议
@protocol OrderbyProtocol<NSObject>
//用于排序
- (NSString *)getListName;

@end

