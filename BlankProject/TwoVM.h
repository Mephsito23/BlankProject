//
//  TwoVM.h
//  BlankProject
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "BaseViewModel.h"

@interface TwoVM : BaseViewModel

@property (nonatomic, strong) RACCommand *pushOneVcCommon;
@property (nonatomic, strong) RACCommand *pushTwoVcCommon;

@end
