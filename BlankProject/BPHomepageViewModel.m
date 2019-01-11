//
//  BPHomepageViewModel.m
//  Oilb2B_iOS
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "BPHomepageViewModel.h"

@interface BPHomepageViewModel()

@property (nonatomic, strong, readwrite) HomeVM *oneVM;
@property (nonatomic, strong, readwrite) TwoVM *twoVM;
@property (nonatomic, strong, readwrite) ThreeVM *threeVM;


@end

@implementation BPHomepageViewModel

- (void)initialize{
     [super initialize];
    
    self.oneVM = [[HomeVM alloc]initWithServices:self.services params:@{@"title":@"首页"}];
    self.twoVM = [[TwoVM alloc]initWithServices:self.services params:@{@"title":@"报价"}];
    self.threeVM = [[ThreeVM alloc]initWithServices:self.services params:@{@"title":@"交易"}];

}

@end
