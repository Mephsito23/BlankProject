//
//  MRCTableViewController.h
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 14/12/27.
//  Copyright (c) 2014年 leichunfeng. All rights reserved.
//

#import "MRCViewController.h"

@interface MRCTableViewController : MRCViewController <UITableViewDataSource,
                                                       UITableViewDelegate,
                                                       UISearchBarDelegate,
                                                       DZNEmptyDataSetSource,
                                                       DZNEmptyDataSetDelegate>

/// The table view for tableView controller.
@property (nonatomic, weak,readonly) UISearchBar *searchBar;
@property (nonatomic, weak,readonly) UITableView *tableView;
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

- (void)reloadData;
- (void)updataTableViews;
- (void)configureLayout;

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;

@end
