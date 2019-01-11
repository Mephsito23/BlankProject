//
//  BaseTestModel.h
//  lxnxqw
//
//  Created by baixunios on 16/1/11.
//  Copyright © 2016年 baixun. All rights reserved.
// 

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface BaseClientModel : BaseModel<YYModel>

/** 动作*/
@property (nonatomic, copy)NSString *action;

- (NSDictionary *)getHttpParams;

@end
