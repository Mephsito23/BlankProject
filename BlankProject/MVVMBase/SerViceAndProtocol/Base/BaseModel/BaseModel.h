//
//  BaseModel.h
//  ptoject1
//
//  Created by Mac on 15/7/22.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (NSDictionary *)getHttpParams;
- (id)initWithDictinary:(NSDictionary *)dic;
- (void)setAttribute:(NSDictionary *)dic;

@property (nonatomic, copy)NSDictionary *map;

//根据正则表达式规则截取需要的字符串
- (NSString *)getRegexWithSourceString:(NSString *)sourceString;


@end
