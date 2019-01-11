//
//  WebViewModel.m
//  TeYouDian
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "WebViewModel.h"

@interface WebViewModel()

@end

@implementation WebViewModel

- (void)initialize{
    
    self.webUrl=self.params[@"webUrl"];
}

- (void)backFounction {
    [self.services popViewModelAnimated:YES];
}

@end
