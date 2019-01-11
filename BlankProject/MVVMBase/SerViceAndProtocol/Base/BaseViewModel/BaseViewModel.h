//
//  BaseViewModel.h
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRCViewModelServices.h"


@interface BaseViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, strong)RACSubject *viewDidLoadSignal;
@property (nonatomic, strong)RACSubject *willDisappearSignal;
@property (nonatomic, strong)RACSubject *willAppearSignal;
@property (nonatomic, strong)RACSubject *backSignal;
/**提示信息*/
@property (nonatomic, strong)RACSubject *tipMessage;

@property (nonatomic, strong)RACSubject *updata;
@property (nonatomic, strong)RACSubject *updateBefore;

/// A RACSubject object, which representing all errors occurred in view model.
@property (nonatomic, strong, readonly) RACSubject *errors;


@property (nonatomic, assign) BOOL shouldFetchLocalDataOnViewModelInitialize;
@property (nonatomic, assign) BOOL shouldRequestRemoteDataOnViewDidLoad;


@property (nonatomic, strong)RACCommand *backCommon;
@property (nonatomic, strong, readonly) id<MRCViewModelServices> services;
@property (nonatomic, copy, readonly) NSDictionary *params;

- (instancetype)initWithServices:(id<MRCViewModelServices>)services params:(NSDictionary *)params;

- (void)initialize;

- (void)backFounction;


@end
