//
//  ShowPictureModel.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "ShowPictureModel.h"
#import "ImageBean.h"

@implementation ShowPictureModel

- (instancetype)initWithBean:(ImageBean *)bean {
    if (self = [super init]) {
        
        self.userProfileURL = bean.user.profileImage.small;
        self.userName = bean.user.name;
        self.address = bean.user.location;
        self.imageURL = bean.urls.small;
    }
    return self;
}

+ (instancetype)modelWithBean:(ImageBean *)bean {
    return [[self alloc]initWithBean:bean];
}

- (NSString *)modelWithCellIdentifier {
    return @"ShowPictureCell";
}

@end
