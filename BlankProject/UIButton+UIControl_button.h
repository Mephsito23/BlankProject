//
//  UIButton+UIControl_button.h
//  Transportation
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval .5//默认时间间隔

@interface UIButton (UIControl_button)

@property(nonatomic,assign) NSTimeInterval timeInterval;//用这个给重复点击加间隔
@property(nonatomic,assign) BOOL isIgnoreEvent;//YES不允许点击NO允许点击

@end
