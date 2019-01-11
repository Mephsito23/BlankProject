//
//  BaseTableViewViewModel.m
//  TVRecharge
//
//  Created by mac on 17/6/12.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "BaseTableViewViewModel.h"

@interface BaseTableViewViewModel()

@property (nonatomic, strong, readwrite) RACCommand *requestRemoteDataCommand;

@end

@implementation BaseTableViewViewModel

- (void)initialize {
    [super initialize];
    

    self.page = 1;
    self.perPage = 100;
    self.canPullRefresh=YES;
    self.shouldPullToRefresh=YES;
    self.shouldPullToGetMoreData=YES;
    self.showLoadHUD = YES;
    self.needFirstLoadData = YES;
    
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^(NSNumber *page) {
        @strongify(self)
        if (self.isShowLoadHUD) { //在网络请求时需要加载 HUD
            [self.configureProHUDSubject sendNext:@1];
        }
        self.page = page.integerValue;
        return [[[self requestRemoteDataSignalWithPage:self.page]
                                             takeUntil:self.rac_willDeallocSignal]
                                               finally:^{
                                                   
                                                   if (self.isShowLoadHUD) {
                                                       [self.configureProHUDSubject sendNext:@0];
                                                   }
                }];
        }];
    
    [[self.requestRemoteDataCommand.errors
      filter:[self requestRemoteDataErrorsFilter]]
     subscribe:self.errors];
    
    
}

#pragma mark  - 接口方法

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
    return ^(NSError *error) {
        return YES;
    };
}

- (id)fetchLocalData {
    return nil;
}

- (NSUInteger)offsetForPage:(NSUInteger)page {
    return (page - 1) * self.perPage;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    return [RACSignal empty];
}

- (NSString *)getIdentifierWithIndex:(NSIndexPath *)index{
    return @"UITableViewCell";
}

- (BOOL)judgeDataSouceIsBlank{
    
    if (!self.dataSource) return YES;
    if (self.dataSource.count == 0) return YES;

    __block BOOL isBlank=YES;
    [self.dataSource enumerateObjectsUsingBlock:^(NSArray *obj,
                                                            NSUInteger idx,
                                                            BOOL * _Nonnull stop) {
        if (obj.count > 0) {
            isBlank = NO;
            *stop=YES;
        }
    }];
    
    return isBlank;
}

- (void)reloadTableView{}

- (RACSubject *)configureProHUDSubject{
    if (_configureProHUDSubject==nil) {
        _configureProHUDSubject=[RACSubject subject];
    }
    return _configureProHUDSubject;
}

@end
