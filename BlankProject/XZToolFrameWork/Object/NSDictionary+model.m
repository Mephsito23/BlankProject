//
//  NSDictionary+model.m
//  Transportation
//
//  Created by mac on 2018/3/26.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSDictionary+model.h"
#import <objc/runtime.h>

@implementation NSDictionary (model)

+ (NSDictionary *)dictWithModel:(NSObject *)object {
    
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

@end
