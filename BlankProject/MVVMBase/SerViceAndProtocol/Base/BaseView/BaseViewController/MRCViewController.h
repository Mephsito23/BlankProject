//
//  MRCViewController.h
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"


@class BaseViewModel;
@interface MRCViewController : UIViewController


@property (nonatomic, strong)UIButton * leftBtn;
@property (nonatomic, strong)UIButton * rightBtn;


/// The `viewModel` parameter in `-initWithViewModel:` method.
@property (nonatomic, strong, readonly) BaseViewModel *viewModel;
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property (nonatomic, strong) UIView *snapshot;

/// Initialization method. This is the preferred way to create a new view.
///
/// viewModel - corresponding view model
///
/// Returns a new view.
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;

/// Binds the corresponding view model to the view.
- (void)bindViewModel;

- (void)layPageSubViews;



@end
