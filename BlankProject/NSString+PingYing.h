//
//  NSString+PingYing.h
//  Transportation
//
//  Created by mac on 2018/4/2.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PingYing)

+ (NSString *)getFirstLetterFromString:(NSString *)aString;

- (NSString *)getPingYing;

- (NSString *)encodeBySign;

+ (NSString *)subTextWith:(NSString *)str;

- (NSString *)disable_EmojiString;

@end
