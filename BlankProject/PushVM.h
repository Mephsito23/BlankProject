//
//  PushVM.h
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "BaseViewModel.h"

@class ImageBean;
@interface PushVM : BaseViewModel

@property (nonatomic, strong, readonly) ImageBean *model;

@property (nonatomic, strong) RACCommand *getRandomImageCommon;

@end
