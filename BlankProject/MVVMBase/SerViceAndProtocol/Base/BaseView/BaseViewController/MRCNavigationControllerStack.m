//
//  MRCNavigationControllerStack.m
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MRCNavigationControllerStack.h"
#import "MRCViewController.h"
#import "MRCNavigationController.h"
#import "MRCTabBarController.h"
#import "MRCRouter.h"

@interface MRCNavigationControllerStack()<UINavigationControllerDelegate>

@property (nonatomic, strong) id<MRCViewModelServices> services;
@property (nonatomic, strong) NSMutableArray *navigationControllers;

@end

@implementation MRCNavigationControllerStack

- (instancetype)initWithServices:(id<MRCViewModelServices>)services {
    self = [super init];
    if (self) {
        self.services = services;
        self.navigationControllers = [[NSMutableArray alloc] init];
        [self registerNavigationHooks];
    }
    return self;
}

- (void)pushNavigationController:(UINavigationController *)navigationController {
    if ([self.navigationControllers containsObject:navigationController]) return;
    navigationController.delegate = self;
    [self.navigationControllers addObject:navigationController];
}

- (UINavigationController *)popNavigationController {
    UINavigationController *navigationController = self.navigationControllers.lastObject;
    [self.navigationControllers removeLastObject];
    return navigationController;
}


- (UINavigationController *)topNavigationController {
    return self.navigationControllers.lastObject;
}

- (void)registerNavigationHooks {
    
    @weakify(self)
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(pushViewModel:animated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         
         MRCViewController *topViewController = (MRCViewController *)[self.navigationControllers.lastObject topViewController];
         if (topViewController.tabBarController) {
             topViewController.snapshot = [topViewController.tabBarController.view snapshotViewAfterScreenUpdates:NO];
         } else {
             topViewController.snapshot = [[self.navigationControllers.lastObject view] snapshotViewAfterScreenUpdates:NO];
         }
         
         UIViewController *viewController = (UIViewController *)[MRCRouter.sharedInstance viewControllerForViewModel:tuple.first];
         viewController.hidesBottomBarWhenPushed = YES;
         
         id nav = self.navigationControllers.lastObject;
         [nav pushViewController:viewController animated:[tuple.second boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(popViewModelAnimated:)]
     subscribeNext:^(RACTuple *tuple) {
        	@strongify(self)
         [self.navigationControllers.lastObject popViewControllerAnimated:[tuple.first boolValue]];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(popToRootViewModelAnimated:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self.navigationControllers.lastObject popToRootViewControllerAnimated:[tuple.first boolValue]];
         [XZNotificationCenter postNotificationName:kDELETETABBARITEMNTF object:nil];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(presentViewModel:animated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
        	@strongify(self)
         UIViewController *viewController = (UIViewController *)[MRCRouter.sharedInstance viewControllerForViewModel:tuple.first];
         
         UINavigationController *presentingViewController = self.navigationControllers.lastObject;
         if (![viewController isKindOfClass:UINavigationController.class]) {
             viewController = [[MRCNavigationController alloc] initWithRootViewController:viewController];
         }
         [self pushNavigationController:(UINavigationController *)viewController];
         
         [presentingViewController presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(presentViewModelWithCurrentVC:animated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         
         UIViewController *viewController = (UIViewController *)[MRCRouter.sharedInstance viewControllerForViewModel:tuple.first];
         UINavigationController *presentingViewController = self.navigationControllers.lastObject;
         UIViewController *topViewController=presentingViewController.topViewController;
         
         
         
//         CATransition *animation = [CATransition animation];
//         animation.duration = 0.15f;
//         animation.type = kCATransitionMoveIn;
//         animation.subtype = kCATransitionFromRight;

         if (topViewController.tabBarController) {
             
//             [topViewController.tabBarController.view.window.layer addAnimation:animation forKey:nil];
             [topViewController.tabBarController presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
             
         } else {
//             [topViewController.view.window.layer addAnimation:animation forKey:nil];
             [topViewController presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
         }

     }];

    [[(NSObject *)self.services
      rac_signalForSelector:@selector(dismissViewModelAnimated:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self popNavigationController];
         [self.navigationControllers.lastObject dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(dismissViewModelAnimatedWithCurrentVC:completion:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         
         UINavigationController *presentingViewController = self.navigationControllers.lastObject;
         UIViewController *topViewController=presentingViewController.visibleViewController;
         [topViewController dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
     }];
    
    [[(NSObject *)self.services
      rac_signalForSelector:@selector(resetRootViewModel:)]
     subscribeNext:^(RACTuple *tuple) {
         @strongify(self)
         [self.navigationControllers removeAllObjects];
         
         UIViewController *viewController = (UIViewController *)[MRCRouter.sharedInstance viewControllerForViewModel:tuple.first];
         
         if (![viewController isKindOfClass:[UINavigationController class]] &&
             ![viewController isKindOfClass:[MRCTabBarController class]]) {
             viewController = [[MRCNavigationController alloc] initWithRootViewController:viewController];
             [self pushNavigationController:(UINavigationController *)viewController];
         }
 
         BPSharedAppDelegate.window.rootViewController=viewController;
     }];
   
}



@end
