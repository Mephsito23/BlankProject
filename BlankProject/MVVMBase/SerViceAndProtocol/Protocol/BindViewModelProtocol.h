//
//  BindViewModelProtocol.h
//  TeYouDian
//
//  Created by mac on 17/1/13.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BindViewModelProtocol <NSObject>

@optional

- (void)viewBindViewModel:(id)viewModel;

- (void)viewBindModel:(id)model;

#pragma mark  - cell Protocol

- (void)cellBindViewModel:(id)viewModel;

- (void)cellBindModel:(id)model;

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object;

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object index:(NSIndexPath *)index;

+ (CGFloat)cellHeightWithtableView:(UITableView *)tableView rowHeightForObject:(id)model;

+ (CGSize)itemSizeWithModel:(id)model;

- (NSString *)modelWithCellIdentifier;

@end


