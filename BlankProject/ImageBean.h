//
//  ImageBean.h
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageInfoBean,ImageUserBean;
@interface ImageBean : NSObject<YYModel>

@property (nonatomic, strong) ImageInfoBean *urls;
@property (nonatomic, strong) ImageUserBean *user;

@end

#pragma mark  - ImageInfoBean
@interface ImageInfoBean : NSObject<YYModel>

@property (nonatomic, copy) NSString *raw;
@property (nonatomic, copy) NSString *full;
@property (nonatomic, copy) NSString *regular;
@property (nonatomic, copy) NSString *small;
@property (nonatomic, copy) NSString *thumb;

@end

#pragma mark  - ImageUserBean
@class ImageUserLinkBean;
@interface ImageUserBean : NSObject<YYModel>

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *updated_at;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *first_name;
@property (nonatomic, copy) NSString *last_name;
@property (nonatomic, copy) NSString *twitter_username;
@property (nonatomic, copy) NSString *portfolio_url;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) ImageUserLinkBean *profileImage;

@end

#pragma mark  - ImageUserLinkBean
@interface ImageUserLinkBean : NSObject<YYModel>

@property (nonatomic, copy) NSString *small;
@property (nonatomic, copy) NSString *medium;
@property (nonatomic, copy) NSString *large;

@end
