//
//  AppDelegate.m
//  BlankProject
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "AppDelegate.h"
#import "MRCViewModelServicesImpl.h"
#import "BaseViewModel.h"
#import "MRCNavigationController.h"
#import "BPHomepageViewModel.h"
#import "AppDelegate+Configure.h"

@interface AppDelegate ()

@property (nonatomic, strong, readwrite) MRCViewModelServicesImpl *services;
@property (nonatomic, strong) BaseViewModel *viewModel;
@property (nonatomic, strong, readwrite) MRCNavigationControllerStack *navigationControllerStack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //配置日志
    [self configureLog];
    
    //配置键盘
    [self configureKeyboardManager];
    
    [SVProgressHUD setMinimumDismissTimeInterval:0.4f];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.services = [[MRCViewModelServicesImpl alloc] init];
    self.navigationControllerStack = [[MRCNavigationControllerStack alloc] initWithServices:self.services];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self configureNetWorking];
    [self.services resetRootViewModel:[self createInitialViewModel]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(BPHomepageViewModel *)createInitialViewModel{
    
    BPHomepageViewModel *viewModel=[[BPHomepageViewModel alloc]initWithServices:self.services params:nil];
    return viewModel;
}


@end
