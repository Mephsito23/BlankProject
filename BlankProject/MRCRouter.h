//
//  MRCRouter.h
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRCViewController.h"
#import "BaseViewModel.h"

@interface MRCRouter : NSObject

/// Retrieves the shared router instance.
///
/// Returns the shared router instance.
+ (instancetype)sharedInstance;

/// Retrieves the view corresponding to the given view model.
///
/// viewModel - The view model
///
/// Returns the view corresponding to the given view model.
- (MRCViewController *)viewControllerForViewModel:(BaseViewModel *)viewModel;

@end
