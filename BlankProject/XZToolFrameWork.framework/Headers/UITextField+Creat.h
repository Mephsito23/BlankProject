//
//  UITextField+Creat.h
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Creat)

/**
 创建一个 TextField
 
 @param placeholder      占位文字
 @param space           距边框间距
 @param backgroundColor 背景颜色
 @param textFont 字体大小
 
 @return 返回的 textfield
 */
+ (UITextField *)textFiedWithPlaceholder:(NSString *)placeholder
                                   space:(CGFloat)space
                         backgroundColor:(UIColor *)backgroundColor
                                textFont:(CGFloat)textFont;


@end
