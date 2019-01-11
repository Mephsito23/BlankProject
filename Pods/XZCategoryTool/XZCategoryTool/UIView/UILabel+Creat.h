//
//  UILabel+Creat.h
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Creat)
/**
 创建一个 单行Label
 
 @param title Label的标题
 @param font  Label 的字体大小
 @param color  Label 的字体颜色
 
 @return 生成的 Label
 */
+(UILabel *)labelWithText:(NSString*)title font:(CGFloat)font color:(UIColor*)color;

@end
