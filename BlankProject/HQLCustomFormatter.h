//
//  HQLCustomFormatter.h
//  Oilb2B_iOS
//
//  Created by mac on 2018/1/20.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQLCustomFormatter : NSObject<DDLogFormatter>{
    int atomicLoggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}

@end
