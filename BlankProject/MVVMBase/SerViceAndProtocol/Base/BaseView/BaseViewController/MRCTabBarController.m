//
//  MRCTabBarController.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/1/9.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "MRCTabBarController.h"
#import "YUBaseTabBar.h"

@interface MRCTabBarController ()<XZmytabbarDelegate>

@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;



@end

@implementation MRCTabBarController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    //移除原生的tabbar
    [self removeTabbar];
}

//移除原生的tabbar
- (void)removeTabbar{
    
    for (UIView *view in self.tabBarController.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController = [[UITabBarController alloc] init];

    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    
    
    [self configuretabbar];
    
    @weakify(self);
    [[[XZNotificationCenter rac_addObserverForName:kDELETETABBARITEMNTF object:nil]
      takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNotification * _Nullable x) {
         @strongify(self);
         [self removeTabbar];
     }];
}


-(void)configuretabbar{
    
    if (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max) {
        YUBaseTabBar *baseTabBar = [[YUBaseTabBar alloc] init];
        [self.tabBarController setValue:baseTabBar forKey:@"tabBar"];
    }
    
    XZmytabbar*tabbar=[[XZmytabbar alloc]init];
    tabbar.frame=self.tabBarController.tabBar.bounds;
    [self.tabBarController.tabBar addSubview:tabbar];
    tabbar.xzMyTabbarDelegate = self;
    self.tabbarView=tabbar;
    

}


- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}

@end
