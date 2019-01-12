//
//  BPHomePageViewController.m
//  Oilb2B_iOS
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "BPHomePageViewController.h"
#import "BPHomepageViewModel.h"
#import "MRCNavigationController.h"

#import "HomeVC.h"
#import "TwoVC.h"
#import "ThreeVC.h"

#import "AppDelegate.h"

@interface BPHomePageViewController ()

@property (nonatomic, strong) BPHomepageViewModel *viewModel;

@end

@implementation BPHomePageViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabbarView.btnSelct = ^BOOL(UIButton *btn) {
        return YES;
    };
    
    UINavigationController *OneNavigationController = ({
        HomeVC *OneViewController = [[HomeVC alloc] initWithViewModel:self.viewModel.oneVM];
        OneViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                                     image:[UIImage imageNamed:@"jy_shouye"]
                                                             selectedImage:[UIImage imageNamed:@"jy_shouye_cheng"]];
        //设置tabbar按钮
        [self.tabbarView addTabbarButton:OneViewController.tabBarItem];
        
        [[MRCNavigationController alloc] initWithRootViewController:OneViewController];
    });
    
    
    
    UINavigationController *TwoNavigationController = ({
        TwoVC *TwoViewController = [[TwoVC alloc] initWithViewModel:self.viewModel.twoVM];
        
        TwoViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"图片"
                                                                     image:[UIImage imageNamed:@"jy_hangqing"]
                                                             selectedImage:[UIImage imageNamed:@"jy_hangqing_cheng"]];
        
         [self.tabbarView addTabbarButton:TwoViewController.tabBarItem];
        
        [[MRCNavigationController alloc] initWithRootViewController:TwoViewController];
    });
    
    UINavigationController *ThreeNavigationController = ({
        ThreeVC *threeViewController = [[ThreeVC alloc] initWithViewModel:self.viewModel.threeVM];

        threeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                                     image:[UIImage imageNamed:@"jy_shangpin_hui"]
                                                             selectedImage:[UIImage imageNamed:@"jy_shangpin"]];
        
        [self.tabbarView addTabbarButton:threeViewController.tabBarItem];
        [[MRCNavigationController alloc] initWithRootViewController:threeViewController];
    });
    

   self.tabBarController.viewControllers = @[ OneNavigationController, TwoNavigationController, ThreeNavigationController];
   
    [BPSharedAppDelegate.navigationControllerStack pushNavigationController:OneNavigationController];

    @weakify(self);
    [[self
      rac_signalForSelector:@selector(tabbarButton:from:to:)
      fromProtocol:@protocol(XZmytabbarDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self);
         
         NSNumber *index=tuple.third;
         UINavigationController *nav=self.tabBarController.viewControllers[index.integerValue];
         [self.tabBarController setSelectedIndex:index.integerValue];
         
         [BPSharedAppDelegate.navigationControllerStack popNavigationController];
         [BPSharedAppDelegate.navigationControllerStack pushNavigationController:nav];
     }];
}

@end
