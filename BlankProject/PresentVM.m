//
//  PresentVM.m
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PresentVM.h"

@implementation PresentVM

///返回时方法,默认为push对应的退出方法:popViewModelAnimated,如果为presentViewModel出来的控制器需要重写改方法为dissmiss
- (void)backFounction {
    [self.services dismissViewModelAnimated:YES completion:nil];
}

@end
