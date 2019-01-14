//
//  RequestPageDataVM.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "RequestPageDataVM.h"
#import "GetPictureClient.h"
#import "ImageBean.h"
#import "ShowPictureModel.h"


@interface RequestPageDataVM ()

@property (nonatomic, strong) NSMutableArray *resultsArr;

@end

@implementation RequestPageDataVM

- (void)initialize{
    [super initialize];
    
    self.cellIdentifier = @[@"ShowPictureCell"];
}

#pragma mark  - Public

#pragma mark  - Private

- (NSString *)getIdentifierWithIndex:(NSIndexPath *)index{
    return self.cellIdentifier.firstObject;
}

- (void)configModelArr {
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        ShowPictureModel *model = [ShowPictureModel new];
        [modelArr addObject:model];
    }
    
    self.dataSource = @[modelArr];
}

#pragma mark  - 网络请求

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    
    GetPictureClient *client = [GetPictureClient new];
    client.page = @(MAX(self.page, 1));
    
    NSDictionary *dict = [NSDictionary dictWithModel:client];
    client.requestArgument = dict;
    
    [SVProgressHUD show];
    return [[XZRacsignHttpTool httpWithRequest:client]
            doNext:^(id  responseObj) {
                [SVProgressHUD dismiss];
                DDLogDebug(@"%@",responseObj);
                
                NSArray *results = responseObj;
                if (!results) return;
                    
                NSInteger pages = self.page;
                if ((pages != 1) && (results.count == 0)) {
                    self.page = self.page-1;
                    self.dataSource = @[self.resultsArr];
                    return;
                }
                
                NSMutableArray *modelArr = [NSMutableArray array];
                [results enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
                    @autoreleasepool {
                        ImageBean *bean = [ImageBean modelWithDictionary:dict];
                        ShowPictureModel *model = [ShowPictureModel modelWithBean:bean];
                        [modelArr addObject:model];
                    }
                }];

                if (pages == 1) {
                    self.resultsArr = [NSMutableArray arrayWithArray:modelArr];
                }else{
                    [self.resultsArr addObjectsFromArray:modelArr];
                }
                
                self.dataSource = @[self.resultsArr];

            }];
}

#pragma mark  - Getter and Setter

LazyLoadMethod(resultsArr)

@end
