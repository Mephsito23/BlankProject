//
//  MRCNavigationControllerStack.h
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MRCViewModelServices.h"
#import <UIKit/UIKit.h>

@protocol MRCViewModelServices;

@interface MRCNavigationControllerStack : NSObject

- (instancetype)initWithServices:(id<MRCViewModelServices>)services;

/// Pushes the navigation controller.
///
/// navigationController - the navigation controller
- (void)pushNavigationController:(UINavigationController *)navigationController;

/// Pops the top navigation controller in the stack.
///
/// Returns the popped navigation controller.
- (UINavigationController *)popNavigationController;

/// Retrieves the top navigation controller in the stack.
///
/// Returns the top navigation controller in the stack.
- (UINavigationController *)topNavigationController;

@end
