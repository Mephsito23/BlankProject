//
//  NSMutableArray+JsonArray.h
//  Transportation
//
//  Created by mac on 2018/4/19.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JsonArray)

+ (NSMutableArray *)xz_arrayWithJsonArray:(NSString *)jsonArr;

- (NSString *)xz_jsonStringEncoded;

@end
