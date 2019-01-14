//
//  ManyCellVM.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "ManyCellVM.h"
#import "PictureModel.h"
#import "PictureTwoModel.h"


@interface ManyCellVM ()

@end

@implementation ManyCellVM

- (void)initialize{
    [super initialize];
    
    ///是否可以下拉刷新,上拉加载, 默认为YES
    self.canPullRefresh = NO;
    
    ///=======================
    ///在该数组中声明要注册的 Cell
    ///=======================
    self.cellIdentifier = @[@"PictureCell", @"PictureTwoCell"];
    
    [self configModelArr];
}

#pragma mark  - Public

#pragma mark  - Private

///=================================
///必须方法,通过该方法获取index对应的Cell
///=================================
- (NSString *)getIdentifierWithIndex:(NSIndexPath *)index{
    id<BindViewModelProtocol> model = self.dataSource[index.section][index.row];
    return model.modelWithCellIdentifier;
}

- (void)configModelArr {
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (int i = 0; i < 50; i++) {
        
        if (i % 2 == 0) {
            PictureModel *model = [PictureModel new];
            model.index = @(i).stringValue;
            [modelArr addObject:model];
            continue;
        }
        
        if (i % 3 == 0) {
            PictureTwoModel *model = [PictureTwoModel new];
            model.index = @(i).stringValue;
            [modelArr addObject:model];
            continue;
        }
    }
    
    ///=============================
    ///dataSource包含所有Cell的数据模型
    ///=============================
    self.dataSource = @[modelArr];
}

#pragma mark  - 网络请求

#pragma mark  - Getter and Setter


@end
