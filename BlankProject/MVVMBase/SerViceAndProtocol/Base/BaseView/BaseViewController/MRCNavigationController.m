//
//  MRCNavigationController.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/2/12.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "MRCNavigationController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>


@interface MRCNavigationController(){
    UIImageView *navBarHairlineImageView;
}

@end

@implementation MRCNavigationController

//加载 第一次使用 调用一次
+ (void)initialize{
    //     设置导航栏字体 颜色 大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorNavTitle,NSFontAttributeName:[UIFont systemFontOfSize:NavTitleFont]}];
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        [UINavigationBar appearance].tintColor = ColorNav;
        [UINavigationBar appearance].translucent=NO;
        
    }else{
        
        [UINavigationBar appearance].barTintColor = ColorNav;
        [UINavigationBar appearance].translucent=NO;
    }
    
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled=YES;
    
     navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
   
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}




#pragma mark  -  mark

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

@end
