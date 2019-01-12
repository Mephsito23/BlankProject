//
//  GetRandomImageClient.m
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "GetRandomImageClient.h"

@implementation GetRandomImageClient

- (NSString *)apiMethodName {
    /**
     完整 URL为https://api.unsplash.com/photos/random
     域名在contastNam.m  BASEURL全局变量中设置,
     如果不想使用全局变量域名,可以在该文件中实现useCustomApiMethodName方法,如下注释,然后在该方法中
     返回自定义URL
     */
    return @"/photos/random";
    
    //需要实现useCustomApiMethodName方法,不然会自动拼接全局域名
//    return "https://source.unsplash.com/random"
}

//- (BOOL)useCustomApiMethodName {
//    return YES;
//}


- (LCRequestMethod)requestMethod {
    return LCRequestMethodGet;
}

- (void)dealloc{
    DDLogVerbose(@"%s", __func__);
}

@end
