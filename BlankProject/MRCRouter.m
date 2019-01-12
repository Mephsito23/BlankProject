//
//  MRCRouter.m
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MRCRouter.h"

@interface MRCRouter()

@property (nonatomic, copy) NSDictionary *viewModelViewMappings; // viewModel到view的映射

@end

@implementation MRCRouter


+ (instancetype)sharedInstance {
    static MRCRouter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (MRCViewController *)viewControllerForViewModel:(BaseViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[MRCViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"BaseTableViewViewModel" : @"MRCTableViewController",
             @"BPHomepageViewModel" : @"BPHomePageViewController",
             @"HomeVM" : @"HomeVC",
             @"TwoVM" : @"TwoVC",
             @"ThreeVM" : @"ThreeVC",
             @"PushVM" : @"PushVC",
             @"PresentVM" : @"PresentVC",
             };
    
}

@end
