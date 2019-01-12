//
//  HomeVM.m
//  BlankProject
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "HomeVM.h"
#import "TwoVM.h"
#import "ThreeVM.h"


@interface HomeVM ()

@end

@implementation HomeVM

//父类初始化方法
- (void)initialize{
    ///如果继承自BaseTableViewViewModel 需要添加以下这句重载父类方法
//    [super initialize];

    @weakify(self);
    self.pushCommon = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        
        /// 在dict中加入需要传递到下个界面的值,标题默认key为title, 不需要传值可以传nil
        NSDictionary *dict = @{@"title" : @"push控制器"};
        TwoVM *viewModel = [[TwoVM alloc]initWithServices:self.services params:dict];
        [self.services pushViewModel:viewModel animated:YES];

        return [RACSignal empty];
    }];

}

#pragma mark  - Public

#pragma mark  - Private

#pragma mark  - 网络请求

#pragma mark  - Getter and Setter

///懒加载方式
- (RACCommand *)presentCommon {
    if (_presentCommon == nil) {
        @weakify(self);
        _presentCommon = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            
            NSDictionary *dict = @{@"title" : @"present控制器"};
            ThreeVM *viewModel = [[ThreeVM alloc]initWithServices:self.services params:dict];
            [self.services presentViewModel:viewModel animated:YES completion:nil];
            
            return [RACSignal empty];
        }];
        
    }
    return _presentCommon;
}


@end
