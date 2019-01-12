//
//  HomeVM.h
//  BlankProject
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeVM : BaseViewModel

@property (nonatomic, strong) RACCommand *pushCommon;
@property (nonatomic, strong) RACCommand *presentCommon;

@end
