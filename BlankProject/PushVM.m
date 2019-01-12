//
//  PushVM.m
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PushVM.h"
#import "GetRandomImageClient.h"
#import "ImageBean.h"


@interface PushVM ()

@property (nonatomic, strong, readwrite) ImageBean *model;

@end

@implementation PushVM

- (void)initialize{
    
    [self.getRandomImageCommon execute:nil];
}

#pragma mark  - Public

#pragma mark  - Private

#pragma mark  - 网络请求

- (RACCommand *)getRandomImageCommon {
    if (_getRandomImageCommon == nil) {
        @weakify(self);
        _getRandomImageCommon = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            
            GetRandomImageClient *client = [GetRandomImageClient new];
            
            [SVProgressHUD show];
            return [[XZRacsignHttpTool httpWithRequest:client]
                    doNext:^(id  responseObj) {
                        [SVProgressHUD dismiss];
                        ImageBean *model = [ImageBean modelWithDictionary:responseObj];
                        self.model = model;
                    }];
        }];
        
    }
    return _getRandomImageCommon;
}

#pragma mark  - Getter and Setter


@end
