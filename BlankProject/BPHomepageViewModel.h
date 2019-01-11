//
//  BPHomepageViewModel.h
//  Oilb2B_iOS
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "BPTabBarViewModel.h"

#import "HomeVM.h"
#import "TwoVM.h"
#import "ThreeVM.h"


@interface BPHomepageViewModel : BPTabBarViewModel

@property (nonatomic, strong, readonly) HomeVM *oneVM;
@property (nonatomic, strong, readonly) TwoVM *twoVM;
@property (nonatomic, strong, readonly) ThreeVM *threeVM;

@end
