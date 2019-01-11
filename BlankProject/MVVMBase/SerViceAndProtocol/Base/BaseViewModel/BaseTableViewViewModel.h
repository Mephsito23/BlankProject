//
//  BaseTableViewViewModel.h
//  TVRecharge
//
//  Created by mac on 17/6/12.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "BaseViewModel.h"
#import "MRCViewModelServices.h"

@interface BaseTableViewViewModel : BaseViewModel

/// 数据源数组
@property (nonatomic, copy) NSArray *dataSource;

/// 侧面拇指索引数组
@property (nonatomic, copy) NSArray *sectionIndexTitles;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger perPage;

///是否可以刷新
@property (nonatomic, assign,getter=isCanPullRefresh) BOOL canPullRefresh;
///设置是否可以下拉刷新
@property (nonatomic, assign,getter=isShouldPullToRefresh) BOOL shouldPullToRefresh;
///设置是否可以上拉加载
@property (nonatomic, assign,getter=isShouldPullToGetMoreData) BOOL shouldPullToGetMoreData;

@property (nonatomic, assign,getter=isShouldInfiniteScrolling) BOOL shouldInfiniteScrolling;

///是否需要第一创建时加载数据 默认 YES
@property (nonatomic, assign,getter=isNeedFirstLoadData) BOOL needFirstLoadData;

///在网络请求时需要加载 HUD 默认为 YES
@property (nonatomic, assign,getter=isShowLoadHUD) BOOL showLoadHUD;

@property (nonatomic, copy) NSString *keyword;

@property (nonatomic, strong) RACCommand *didSelectCommand;
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;

@property (nonatomic, strong)RACSubject *configureProHUDSubject;

@property (nonatomic, strong)NSArray *cellIdentifier;
@property (nonatomic, strong)NSArray *headerIdentifier;


- (id)fetchLocalData;

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter;

- (NSUInteger)offsetForPage:(NSUInteger)page;

- (void)reloadTableView;


/**
 获取网络数据

 @param page 页数

 @return 返回结果信号
 */
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

/**
  根据索引配置 cell 的标识符,推荐先使用 cellIdentifier数组设置

 @param index 索引

 @return 返回改索引下的 cell 标识符  
 */
- (NSString *)getIdentifierWithIndex:(NSIndexPath *)index;

/**
 判断 DataSource 以及其内部子数组是否为空

 @return 返回结果
 */
- (BOOL)judgeDataSouceIsBlank;

@end
