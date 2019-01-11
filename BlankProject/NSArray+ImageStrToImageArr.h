//
//  NSArray+ImageStrToImageArr.h
//  Transportation
//
//  Created by mac on 2018/4/10.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ImageStrToImageArr)

+ (NSArray *)xz_arrWithImageStr:(NSString *)imageStr;

- (NSString *)xz_jsonStringEncoded;

@end
