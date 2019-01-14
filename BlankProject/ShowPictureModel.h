//
//  ShowPictureModel.h
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageBean;
@interface ShowPictureModel : NSObject<BindViewModelProtocol>

@property (nonatomic, copy) NSString *userProfileURL;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *imageURL;

- (instancetype)initWithBean:(ImageBean *)bean;
+ (instancetype)modelWithBean:(ImageBean *)bean;

@end
