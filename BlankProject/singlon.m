//
//  singlon.m
//  KaoQin
//
//  Created by mac on 16/11/15.
//  Copyright © 2016年 BaiXun. All rights reserved.
//

#import "singlon.h"

@implementation singlon

static singlon*sharedManager=nil;

+(singlon*)sharedMangager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager=[[self alloc] init];
    });
    
    return sharedManager;
    
}

@end
