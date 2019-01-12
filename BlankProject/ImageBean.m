//
//  ImageBean.m
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "ImageBean.h"

@implementation ImageBean

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"urls" : [ImageInfoBean class],
             @"user" : [ImageUserBean class]
             
             };
}

@end

#pragma mark  - ImageInfoBean
@implementation ImageInfoBean

@end

#pragma mark  - ImageUserBean
@implementation ImageUserBean

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"profileImage"  : @"profile_image",
             @"uid"  : @"id"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"profileImage" : [ImageUserLinkBean class]
             };
}

@end

#pragma mark  - ImageUserLinkBean
@implementation ImageUserLinkBean

@end
