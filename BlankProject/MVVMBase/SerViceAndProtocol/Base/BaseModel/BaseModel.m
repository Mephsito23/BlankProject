//
//  BaseModel.m
//  ptoject1
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


//1.初始化的时候  传入字典
- (id)initWithDictinary:(NSDictionary *)dic {

    if (self = [super init]) {

        [self setAttribute:dic];
    }

    return self;
}

- (void)setAttribute:(NSDictionary *)dic {
    
    if ( [dic  isEqual: @""] ||[dic count] == 0) {
        return;
    }
    
    unsigned int outCount =0;
    Ivar*vars =class_copyIvarList([self class], &outCount);//获取到所有的成员变量列表
    //遍历所有的成员变量
    for(int i =0; i < outCount; i++) {
        Ivar ivar = vars[i];//取出第i个位置的成员变量
        const char*propertyName =ivar_getName(ivar);//获取变量名
        NSString*proOcName = [NSString stringWithUTF8String:propertyName];
        id jsonValue = [dic objectForKey:[proOcName stringByReplacingOccurrencesOfString:@"_" withString:@""]];
        object_setIvar(self, ivar,jsonValue);
        
        
    }
    
    free(vars);
    
}
- (NSString *)getRegexWithSourceString:(NSString *)sourceString{
    
    NSString *regex = @">.*<";
    if (sourceString.length >0) {
        
        //创建正则表达式规则
        NSRegularExpression *regular = [[NSRegularExpression alloc]initWithPattern:regex options:NSRegularExpressionCaseInsensitive error:nil];
        
        //测试字符串
        NSArray *resultArr = [regular matchesInString:sourceString options:NSMatchingReportProgress range:NSMakeRange(0, sourceString.length)];
        
        for (NSTextCheckingResult *result in resultArr) {
            
            NSRange range = result.range;
            
            range.location +=1;//位置加1
            range.length -=2;//长度减2
            
            NSString *str = [sourceString substringWithRange:range];
            return str;
        }
    }
    return @"没有来源";
}

- (NSDictionary *)getHttpParams{
    
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    // class:获取哪个类的成员属性列表
    // count:成员属性总数
    // 拷贝属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        // 属性名
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        // 属性值
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        // 设置KeyValues
        if (propertyValue) [propsDic setObject:propertyValue forKey:propertyName];
    }
    // 需手动释放 不受ARC约束
    free(properties);
    return propsDic;
}

@end
