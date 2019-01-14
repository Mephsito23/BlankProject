//
//  GetPictureClient.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "GetPictureClient.h"

@implementation GetPictureClient

- (NSString *)apiMethodName {
    return @"/photos/curated";
}

- (LCRequestMethod)requestMethod {
    return LCRequestMethodGet;
}

- (void)dealloc{
    DDLogVerbose(@"%s", __func__);
}


@end
