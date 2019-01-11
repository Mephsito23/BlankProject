//
//  ToolWithOther.m
//  IDCardValidation
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "ToolWithOther.h"
//#import "sys/utsname.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <CommonCrypto/CommonDigest.h>


@implementation ToolWithOther

static NSString *const DBNAME = @"test.db";

static const NSString *kRandomAlphabet = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+ (NSString *)getRandomStrWith:(NSInteger)length{
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    @autoreleasepool {
        // insert code here...
        for (int i = 0; i < length; i++) {
            [randomString appendFormat: @"%C", [kRandomAlphabet characterAtIndex:arc4random_uniform((u_int32_t)[kRandomAlphabet length])]];
        }
//        NSLog(@"randomString = %@", randomString);
    }
    return randomString;
}

+ (NSString *)getRandomStr{
    return [self getRandomStrWith:10];
}

#pragma mark  - 排序
+ (NSArray *)getOrderbyListWithArr:(NSArray <OrderbyProtocol>*)listArr{
    
    NSMutableDictionary *addressBookDict=[NSMutableDictionary dictionary];
    
    @autoreleasepool {
        [listArr enumerateObjectsUsingBlock:^(NSObject<OrderbyProtocol>*obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addDict:addressBookDict model:obj];
        }];
    }
    
    return [self listArr:addressBookDict];
}

+ (void)addDict:(NSMutableDictionary *)addressBookDict model:(NSObject<OrderbyProtocol>*)model{
    
    //获取到姓名的大写首字母
    NSString *firstLetterString = [ToolWithOther getFirstLetterFromString:model.getListName];
    //如果该字母对应的联系人模型不为空,则将此联系人模型添加到此数组中
    if (addressBookDict[firstLetterString]){
        
        [addressBookDict[firstLetterString] addObject:model];
    }
    //没有出现过该首字母，则在字典中新增一组key-value
    else{
        //创建新发可变数组存储该首字母对应的联系人模型
        NSMutableArray *arrGroupNames = [NSMutableArray arrayWithObject:model];
        //将首字母-姓名数组作为key-value加入到字典中
        [addressBookDict setObject:arrGroupNames forKey:firstLetterString];
    }
}

+ (NSArray *)listArr:(NSMutableDictionary *)addressBookDict{
    
    // 将addressBookDict字典中的所有Key值进行排序: A~Z
    NSArray *nameKeys = [[addressBookDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    // 将 "#" 排列在 A~Z 的后面
    if ([nameKeys.firstObject isEqualToString:@"#"]){
        NSMutableArray *mutableNamekeys = [NSMutableArray arrayWithArray:nameKeys];
        [mutableNamekeys insertObject:nameKeys.firstObject atIndex:nameKeys.count];
        [mutableNamekeys removeObjectAtIndex:0];
    }
    
    NSLog(@"%@",nameKeys);
    
    NSMutableArray *returnArr=[NSMutableArray array];
    for (int i=0; i<nameKeys.count; i++) {
        NSString *key=nameKeys[i];
        NSArray *tempArr=addressBookDict[key];
        [returnArr addObjectsFromArray:tempArr];
    }
    return returnArr;
    
}

//获取联系人姓名首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)getFirstLetterFromString:(NSString *)aString{
    /**
     * **************************************** START ***************************************
     * 之前PPGetAddressBook对联系人排序时在中文转拼音这一部分非常耗时
     * 参考博主-庞海礁先生的一文:iOS开发中如何更快的实现汉字转拼音 http://www.olinone.com/?p=131
     * 使PPGetAddressBook对联系人排序的性能提升 3~6倍, 非常感谢!
     */
    NSMutableString *mutableString = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    NSString *pinyinString = [mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    /**
     *  *************************************** END ******************************************
     */
    
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



+ (NSDictionary *)getDictWithClass:(NSObject *)object{
    
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
//    unsigned int outCount, i;
//    // class:获取哪个类的成员属性列表
//    // count:成员属性总数
//    // 拷贝属性列表
//    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
//    
//    for (i = 0; i<outCount; i++) {
//        objc_property_t property = properties[i];
//        const char* char_f = property_getName(property);
//        // 属性名
//        NSString *propertyName = [NSString stringWithUTF8String:char_f];
//        // 属性值
//        id propertyValue = [object valueForKey:(NSString *)propertyName];
//        // 设置KeyValues
//        if (propertyValue) [propsDic setObject:propertyValue forKey:propertyName];
//    }
//    // 需手动释放 不受ARC约束
//    free(properties);
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i < count; i++){
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *propertyName = [NSString stringWithUTF8String:ivarName];
        // 属性值
        id propertyValue = [object valueForKey:(NSString *)propertyName];
        
        propertyName=[propertyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        // 设置KeyValues
        if (propertyValue) [propsDic setObject:propertyValue forKey:propertyName];
    }
    free(ivars);
    
    return propsDic;
}




//格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSInteger )number
                           doble:(double)doble{
    
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                                      scale:number
                                                                                           raiseOnExactness:NO
                                                                                            raiseOnOverflow:NO
                                                                                           raiseOnUnderflow:NO
                                                                                        raiseOnDivideByZero:NO];
    NSDecimalNumber* decimal = [[NSDecimalNumber alloc] initWithDouble:doble];
    NSNumber* ratio = [decimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return ratio.stringValue;
}


+(NSString *)getWeekDayWithNSInteger:(NSInteger)weakTeger{
    NSArray *weakArr=@[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    return weakArr[weakTeger-1];
}

+(NSString *)getTimeWithDate:(NSDate *)date
                   isTwoFour:(BOOL)isTwoFour{
    
    if (isTwoFour) {
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat=@"HH:mm";
        return [format stringFromDate:date];
    }
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.AMSymbol = @"上午";
    format.PMSymbol = @"下午";
    format.dateFormat =@"aaahh:mm";
    
    NSString *timeStr = [format stringFromDate:date];
    return timeStr;
}


+ (void)saveDataWithYTK:(NSString *)tableName
                    key:(NSString *)key
                   object:(NSObject<NSCoding> *)object{
    
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DBNAME];
    [store createTableWithName:tableName];
    [store putObject:object withId:key intoTable:tableName];
}


+ (id)getDataWithYTK:(NSString *)tableName
                       key:(NSString *)key{
    
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DBNAME];
    return [store getObjectById:key fromTable:tableName];
    
}

+ (NSArray *)getAllDataWithYTK:(NSString *)tableName{
    
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DBNAME];
    return [store getAllItemsFromTable:tableName];
}



+ (void)saveDataWithTableName:(NSString *)tableName
                          key:(NSString *)key
                         dict:(NSDictionary *)dict{
    
    YYCache *cache = [YYCache cacheWithName:tableName];
    [cache setObject:dict forKey:key];
    
}

+ (void)saveDataWithTableName:(NSString *)tableName
                          key:(NSString *)key
                       object:(NSObject<NSCoding> *)object{
    
    YYCache *cache = [YYCache cacheWithName:tableName];
    [cache setObject:object forKey:key];
    
}


+ (id)getDataWithTableName:(NSString *)tableName
                       key:(NSString *)key{
    
    YYCache *cache = [YYCache cacheWithName:tableName];
    if ([cache containsObjectForKey:key]) {
        return [cache objectForKey:key];
    }
    return nil;
}

+ (void)deleDataWithTableName:(NSString *)tableName
                          key:(NSString *)key{
    
    YYCache *cache = [YYCache cacheWithName:tableName];
    [cache removeObjectForKey:key];
    
}

+ (void)deleDataWithYTK:(NSString *)tableName
                          key:(NSString *)key{
    
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DBNAME];
    [store deleteObjectById:key fromTable:tableName];
}


+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


+ (UIImage *)reglualScaleToSize:(UIImage *)image size:(CGSize)asize{
    
    UIImage *newimage;
    
    if (nil == image) {
        newimage = nil;
    }
    
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height < oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            //            rect.origin.x = 0;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            //            rect.origin.y = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        UIGraphicsBeginImageContext(asize);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        // 绘制改变大小的图片
        [image drawInRect:rect];
        // 从当前context中创建一个改变大小后的图片
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        // 使当前的context出堆栈
        UIGraphicsEndImageContext();
    }
    //返回新的改变大小后的图片
    return newimage;
}

+(UIImagePickerController *)openTakePhoto:(id<UIImagePickerControllerDelegate>)delegate{
    
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([ToolWithOther isCameraCanOpen]) {
        controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    //是否可以编辑
    controller.allowsEditing = YES;
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    controller.mediaTypes = mediaTypes;
    controller.delegate = delegate;
    return controller;
}


#pragma mark  - 相机

+(BOOL)isCameraCanOpen{
    
    return ([self isCameraAvailable] &&
            [self doesCameraSupportTakingPhotos])?YES:NO;
}

+ (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
+ (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}
- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

#pragma mark  - 验证类

+ (BOOL)judgeIdentityStringValid:(NSString *)identityString {
    
    if (identityString.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    //  NSString *regex = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:identityString]) return NO;
    
    //** 开始进行校验 *//
    
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex = [[identityString substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [identityString substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }
    else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
}


// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    return [self oldComparePhone:mobileNum];
}

+ (BOOL)oldComparePhone:(NSString *)mobileNum {
    
    /**    * 手机号码：Mobile Phone
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    
    NSString * MP = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    //中国移动：China Mobile
    //* 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    //中国联通：China Unicom
    //* 130,131,132,152,155,156,185,186
    NSString * CU = @"^1(3[0-2]|5[256]|7[0-9]|8[56])\\d{8}$";
    
    //中国电信：China Telecom
    //* 133,1349,153,180,189
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MP];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    } else  {
        return NO;
    }
    
}


//邮箱
+ (BOOL) validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


//判断定位权限是否开启
+ (BOOL)LocationPermissionsIsOpen{
    
    BOOL judge=NO;
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] ==
         kCLAuthorizationStatusAuthorizedWhenInUse||
         [CLLocationManager authorizationStatus] ==
         kCLAuthorizationStatusNotDetermined ||
         [CLLocationManager authorizationStatus] ==
         kCLAuthorizationStatusAuthorizedAlways)) {
            
        //定位功能可用
        judge=YES;
        
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        //定位不能用
        judge=NO;
    }
    return judge;
}

+ (NSString *)redirectNSlogToDocumentFolder{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSDateFormatter *dateformat = [[NSDateFormatter  alloc]init];
    [dateformat setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *fileName = [NSString stringWithFormat:@"LOG-%@.txt",[dateformat stringFromDate:[NSDate date]]];
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    // 先删除已经存在的文件
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:logFilePath error:nil];
    
    return logFilePath;
    
    //    // 将log输入到文件
    //    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    //
    //    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}

+ (BOOL)isCanOpenNotifiction {
    
    /*
     settings.types 有以下几种状态
     0 => none                  不允许通知 UIUserNotificationTypeNone
     1 => badge                 只允许应用图标标记 UIUserNotificationTypeBadge
     2 => sound                 只允许声音 UIUserNotificationTypeBadge
     3 => sound + badge         允许声音+应用图标标记
     4 => alert                 只允许提醒 UIUserNotificationTypeAlert
     5 => alert + badge         允许提醒+应用图标标记
     6 => alert + sound         允许提醒+声音
     7 => alert + sound + badge 三种都允许
     */
    UIUserNotificationSettings *settings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    /// YES 允许  NO 不允许
    BOOL isCanNTF = (settings.types == 7) || (settings.types == 6) || ((settings.types == 5)) || (settings.types == 4);
    return isCanNTF;
}

@end
