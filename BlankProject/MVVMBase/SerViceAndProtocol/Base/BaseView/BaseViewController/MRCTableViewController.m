//
//  MRCTableViewController.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 14/12/27.
//  Copyright (c) 2014年 leichunfeng. All rights reserved.
//

#import <KafkaRefresh/KafkaRefresh.h>
#import "MRCTableViewController.h"
#import "BaseTableViewViewModel.h"
#import "YYFPSLabel.h"

@interface MRCTableViewController ()

@property (nonatomic, weak,readwrite) UISearchBar *searchBar;
@property (nonatomic, weak,readwrite) UITableView *tableView;
@property (nonatomic, strong) UIImageView *loadingV;

@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@property (nonatomic, strong, readonly) BaseTableViewViewModel *viewModel;

@end

@implementation MRCTableViewController

@dynamic viewModel;

- (instancetype)initWithViewModel:(BaseViewModel*)viewModel {
    self = [super initWithViewModel:viewModel];
   if (self) {
        if ([viewModel shouldRequestRemoteDataOnViewDidLoad]) {
            @weakify(self)
            [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                @strongify(self)
                if (self.viewModel.isNeedFirstLoadData) {
                    [self.viewModel.requestRemoteDataCommand execute:@1];
                }
            }];
        }
    }
    return self;
}

- (void)setView:(UIView *)view {
    [super setView:view];
    if ([view isKindOfClass:UITableView.class]) self.tableView = (UITableView *)view;
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(kNavBarSpace, 0, 0, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = ColorBG;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    [self configureLayout];
    if (self.viewModel.isCanPullRefresh) {
        [self configureTableUpdata];
    }
    
    UIView *rootView = [UIApplication sharedApplication].keyWindow.rootViewController.view;
    [rootView addSubview:self.loadingV];
    
    
#if 0
    self.fpsLabel = [[YYFPSLabel alloc] init];
    [self.view addSubview:self.fpsLabel];
    
    self.fpsLabel.left   = 12;
    self.fpsLabel.bottom = CGRectGetHeight(self.view.frame) - self.contentInset.bottom - 12;
    self.fpsLabel.alpha  = 0;
    self.fpsLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;

    [self.fpsLabel sizeToFit];
    
#endif
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.loadingV removeFromSuperview];
}

- (void)configureLayout{
    
    if (self.searchBar.hidden==YES) {
        self.tableView.sd_resetNewLayout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    }else{
        self.searchBar.sd_resetNewLayout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .topEqualToView(self.view)
        .heightIs(44);
        
        self.tableView.sd_resetNewLayout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .topSpaceToView(self.searchBar,0)
        .bottomEqualToView(self.view);
    }
    
}

- (void)configureTableUpdata{
    
    @weakify(self);
    if (self.viewModel.isShouldPullToRefresh) {

        [self.tableView bindGlobalStyleForHeadRefreshHandler:^{
            @strongify(self);
            [self refreshTriggered];
        }];
        
    }
    
    if (self.viewModel.isShouldPullToGetMoreData) {

        [self.tableView bindGlobalStyleForFootRefreshHandler:^{
            @strongify(self);
            
            self.viewModel.page = self.viewModel.page+1;
            [[self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page)]
             subscribeNext:^(id  _Nullable x) {
                 @strongify(self);
                 [self updataTableViews];
             } completed:^{
                 @strongify(self);
                 [self updataTableViews];
             }];
            
        }];
    }
}

- (void)updataTableViews{
    
    [self.tableView.headRefreshControl endRefreshing];
    [self.tableView.footRefreshControl endRefreshing];
    
    [self.tableView reloadData];
}


- (void)dealloc {
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

- (void)bindViewModel {
    [super bindViewModel];
    
    @weakify(self)
    [[[RACObserve(self.viewModel, dataSource)
        distinctUntilChanged]
        deliverOnMainThread]
        subscribeNext:^(id x) {
            @strongify(self)
            [self reloadData];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(reloadTableView)]
     subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self)
        [self reloadData];
     }];

    [self.viewModel.requestRemoteDataCommand.executing subscribeNext:^(NSNumber *executing) {
        @strongify(self)
        
        UIView *emptyDataSetView = [self.tableView.subviews.rac_sequence objectPassingTest:^(UIView *view) {
            return [NSStringFromClass(view.class) isEqualToString:@"DZNEmptyDataSetView"];
        }];
        emptyDataSetView.alpha = 1.0 - executing.floatValue;
    }];
    
    [[self.viewModel.configureProHUDSubject ignore:nil]
    subscribeNext:^(NSNumber *isShow) {
        
        if (self.viewModel.page > 1) return;

        BOOL isShowPro=isShow.boolValue;
        self.loadingV.hidden = !isShowPro;
        
//        if (isShowPro) {
//            [SVProgressHUD show];
//        }else{
//            [SVProgressHUD dismiss];
//        }
    }];
    
    [[[[XZNotificationCenter rac_addObserverForName:HttpErrorNTF object:nil]throttle:2.0f]
     takeUntil:self.viewModel.willDisappearSignal]
     subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self)
         [self updataTableViews];
     }];
    
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    
    NSAssert(identifier.length != 0, @"cell 标识符为空");
    
#ifdef DEBUG
    
    NSMutableArray *cellIdentifierArr = [NSMutableArray arrayWithArray:self.viewModel.cellIdentifier];
    [cellIdentifierArr addObject:@"UITableViewCell"];
    NSAssert([cellIdentifierArr containsObject:identifier], @"注册标识符错误, 未注册该 cell");
    
#endif

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
    
    //通过协议绑定数据模型
    UITableViewCell<BindViewModelProtocol> *showCell=(UITableViewCell<BindViewModelProtocol> *)cell;
    if ([showCell respondsToSelector:@selector(cellBindModel:)]) {
        [showCell cellBindModel:object];
    }
    if ([showCell respondsToSelector:@selector(cellBindViewModel:)]) {
        [showCell cellBindViewModel:self.viewModel];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataSource ? self.viewModel.dataSource.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ///通过标识符创建cell
    UITableViewCell *cell = [self tableView:tableView
          dequeueReusableCellWithIdentifier:[self.viewModel getIdentifierWithIndex:indexPath]
                               forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id object = self.viewModel.dataSource[indexPath.section][indexPath.row];
    [self configureCell:cell atIndexPath:indexPath withObject:(id)object];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section >= self.viewModel.sectionIndexTitles.count) return nil;
    return self.viewModel.sectionIndexTitles[section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (self.searchBar != nil) {
        if (self.viewModel.sectionIndexTitles.count != 0) {
            return [self.viewModel.sectionIndexTitles.rac_sequence startWith:UITableViewIndexSearch].array;
        }
    }
    return self.viewModel.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (self.searchBar != nil) {
        if (index == 0) {
            [tableView scrollRectToVisible:self.searchBar.frame animated:NO];
        }
        return index - 1;
    }
    return index;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.tableView.rowHeight>0) return self.tableView.rowHeight;
    
    NSString *classStr=[self.viewModel getIdentifierWithIndex:indexPath];
    Class cellName=NSClassFromString(classStr);
    
    BOOL judgeCellHeightOne= [cellName respondsToSelector:@selector(tableView:rowHeightForObject:)];
    BOOL judgeCellHeightTwo= [cellName respondsToSelector:@selector(tableView:rowHeightForObject:index:)];
    
    if (judgeCellHeightOne) {
        id object=self.viewModel.dataSource[indexPath.section][indexPath.row];
        CGFloat height=[cellName tableView:tableView rowHeightForObject:object];
        return height;
    }
    
    if (judgeCellHeightTwo) {
        id object=self.viewModel.dataSource[indexPath.section][indexPath.row];
        CGFloat height=[cellName tableView:tableView rowHeightForObject:object index:indexPath];
        return height;
    }
    
    return 44;
}


- (void)registTableViewCell{
    
    NSArray *cellIdentifier =self.viewModel.cellIdentifier;
    
    for (NSString * cell in cellIdentifier) {
        [self.tableView registerClass:NSClassFromString(cell) forCellReuseIdentifier:cell];
    }
    
    NSArray *headerIdentifier = self.viewModel.headerIdentifier;
    for (NSString * cell in headerIdentifier) {
        [self.tableView registerClass:NSClassFromString(cell) forHeaderFooterViewReuseIdentifier:cell];
    }
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel.didSelectCommand execute:indexPath];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                            self.fpsLabel.alpha = 1;
                         }
                         completion:NULL];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (self.fpsLabel.alpha != 0) {
            [UIView animateWithDuration:1
                                  delay:2
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 self.fpsLabel.alpha = 0;
                             }
                             completion:NULL];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.fpsLabel.alpha != 0) {
        [UIView animateWithDuration:1
                              delay:2
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.fpsLabel.alpha = 0;
                         }
                         completion:NULL];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (self.fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.fpsLabel.alpha = 1;
                         }
                         completion:NULL];
    }
}

#pragma mark - Listening for the user to trigger a refresh
- (void)refreshTriggered{
    @weakify(self)
    [[[self.viewModel.requestRemoteDataCommand
     	execute:@1]
     	deliverOnMainThread]
    	subscribeNext:^(id x) {
            @strongify(self)
            self.viewModel.page = 1;
        } error:^(NSError *error) {
            @strongify(self)
               [self updataTableViews];
        } completed:^{
            @strongify(self)
               [self updataTableViews];
        }];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.viewModel.keyword = searchText;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];

    searchBar.text = nil;
    self.viewModel.keyword = nil;
}

#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    UIImage *image = [UIImage imageNamed:@"zanwushuju"];
    return [image imageScaledToSize:CGSizeMake(image.size.width *2, image.size.height *2)];
}

#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return [self.viewModel judgeDataSouceIsBlank];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView {
    return CGPointMake(0, -(self.tableView.contentInset.top - self.tableView.contentInset.bottom) / 2);
}

#pragma mark  - getter and setter

- (UIImageView *)loadingV {
    if (_loadingV == nil) {
        _loadingV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading_1"]];
        
        CGFloat width = 75;
        CGFloat height = 125;
        CGFloat x = (kScreenWidth - width) * 0.5;
        CGFloat y = (kScreenHeight - height) * 0.5;
        _loadingV.frame = CGRectMake(x, y, width, height);
        _loadingV.hidden = YES;
    }
    return _loadingV;
}

- (UITableView *)tableView{
    if (_tableView==nil) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.emptyDataSetSource=self;
        tableView.emptyDataSetDelegate=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.tableView=tableView;
        
        if (@available(iOS 11.0,*)) {
            self.tableView.estimatedRowHeight = 0;
            self.tableView.estimatedSectionHeaderHeight = 0;
            self.tableView.estimatedSectionFooterHeight = 0;
        }

        //注册 cell
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [self registTableViewCell];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (UISearchBar *)searchBar{
    if (_searchBar==nil) {
        UISearchBar *searchBar=[UISearchBar new];
        searchBar.hidden=YES;
        searchBar.delegate=self;
        searchBar.placeholder=@"搜索";
        searchBar.keyboardType=UIKeyboardTypeDefault;
        self.searchBar=searchBar;
        [self.view addSubview:self.searchBar];
    }
    return _searchBar;
}

@end
