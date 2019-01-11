//
//  MRCViewModelServicesImpl.m
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MRCViewModelServicesImpl.h"
#import "MRCNavigationProtocol.h"

@class BaseViewModel;

@implementation MRCViewModelServicesImpl

- (instancetype)init{
    
    if (self=[super init]) {
        
    }
    return self;
}

- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModelWithCurrentVC:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion{}

- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimatedWithCurrentVC:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(BaseViewModel *)viewModel {}

- (void)configureSiderViewModel:(BaseViewModel *)viewModel{}

@end
