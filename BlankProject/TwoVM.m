//
//  TwoVM.m
//  BlankProject
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "TwoVM.h"
#import "ManyCellVM.h"
#import "RequestPageDataVM.h"


@interface TwoVM ()

@end

@implementation TwoVM

- (void)initialize{
    
    @weakify(self);
    self.pushOneVcCommon = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        
        NSDictionary *dict = @{@"title" : @"多种类Cell布局"};
        ManyCellVM *viewModel = [[ManyCellVM alloc]initWithServices:self.services params:dict];
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
    
    self.pushTwoVcCommon = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        
        NSDictionary *dict = @{@"title" : @"请求分页数据"};
        RequestPageDataVM *viewModel = [[RequestPageDataVM alloc]initWithServices:self.services params:dict];
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];

}


@end
