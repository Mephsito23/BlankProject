//
//  BaseViewModel.m
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "BaseViewModel.h"
#import "MRCViewModelServices.h"

@interface BaseViewModel()


@property (nonatomic, strong, readwrite) id<MRCViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;
@property (nonatomic, strong, readwrite) RACSubject *errors;

@end

@implementation BaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithServices:params:)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    
    return viewModel;
}

- (instancetype)initWithServices:(id<MRCViewModelServices>)services params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        NSString *title = params[@"title"];
        self.title    = (title.length > 0)? title : @"";
        self.services = services;
        self.params   = params;
    }
    return self;
}

-(instancetype)init{
    self=[super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {

}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (RACSubject *)willAppearSignal{
    if (_willAppearSignal==nil) {
        _willAppearSignal=[RACSubject subject];
    }
    return _willAppearSignal;
}

- (RACSubject *)viewDidLoadSignal{
    if (_viewDidLoadSignal==nil) {
        _viewDidLoadSignal=[RACSubject subject];
    }
    return _viewDidLoadSignal;
}

- (RACCommand *)backCommon{
    
    if (_backCommon==nil) {
        _backCommon=[[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            
            [self backFounction];
            [self.backSignal sendNext:@(YES)];
            return [RACSignal empty];
            
        }];
    }
    return _backCommon;
}

- (void)backFounction{
    
    [self.services popViewModelAnimated:YES];
}

-(RACSubject *)tipMessage
{
    if (_tipMessage==nil) {
        _tipMessage=[RACSubject subject];
    }
    return _tipMessage;
}

- (RACSubject *)updata{
    
    if (_updata==nil) {
        _updata=[RACSubject subject];
    }
    return _updata;
}

- (RACSubject *)updateBefore {
    
    if (_updateBefore == nil) {
        _updateBefore = [RACSubject subject];
    }
    return _updateBefore;
}

- (RACSubject *)backSignal {
    
    if (_backSignal == nil) {
        _backSignal = [RACSubject subject];
    }
    return _backSignal;
}

- (RACSubject *)errors {
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}


@end
