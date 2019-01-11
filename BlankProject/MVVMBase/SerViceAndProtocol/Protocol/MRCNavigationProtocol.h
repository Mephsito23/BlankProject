//
//  MRCNavigationProtocol.h
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BaseViewModel.h"

@class BaseViewModel;
typedef void (^VoidBlock)();

@protocol MRCNavigationProtocol <NSObject>


- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated;

/// Pops the top view controller in the stack.
///
/// animated - use animation or not
- (void)popViewModelAnimated:(BOOL)animated;

/// Pops until there's only a single view controller left on the stack.
///
/// animated - use animation or not
- (void)popToRootViewModelAnimated:(BOOL)animated;

/// Present the corresponding view controller.
///
/// viewModel  - the view model
/// animated   - use animation or not
/// completion - the completion handler
- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

- (void)presentViewModelWithCurrentVC:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;


/// Dismiss the presented view controller.
///
/// animated   - use animation or not
/// completion - the completion handler
- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

- (void)dismissViewModelAnimatedWithCurrentVC:(BOOL)animated completion:(VoidBlock)completion;

/// Reset the corresponding view controller as the root view controller of the application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(BaseViewModel *)viewModel;

- (void)configureSiderViewModel:(BaseViewModel *)viewModel;

@end


