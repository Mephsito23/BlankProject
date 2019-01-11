//
//  AppDelegate.h
//  BlankProject
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRCNavigationControllerStack.h"

@class MRCViewModelServicesImpl;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) MRCViewModelServicesImpl *services;
@property (nonatomic, strong, readonly) MRCNavigationControllerStack *navigationControllerStack;

@end

