//
//  UIButton+Creat.h
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Creat)

/**
 返回一个带标题和图片的 Btn
 @param normaLTitle      按钮文字
 @param normalTitleColor 按钮文字颜色
 @param normalImage      按钮图片(普通模式)
 @param titleFont        按钮字体
 
 @return 返回的按钮
 */
+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                     normalImage:(UIImage *)normalImage
                       titleFont:(CGFloat )titleFont;


/**
 返回一个带标题和背景图片的 Btn
 
 @param normaLTitle      按钮文字
 @param normalTitleColor 按钮文字颜色
 @param backImage        背景图片
 @param titleFont        按钮文字字体
 
 @return 返回的按钮
 */
+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                       backImage:(UIImage *)backImage
                       titleFont:(CGFloat )titleFont;


/**
 返回一个详细设置的Btn
 
 @param normaLTitle       按钮文字(普通模式)
 @param normalTitleColor 按钮文字颜色(普通模式)
 @param selectTitle      按钮文字(选中模式)
 @param selectTitleColor 按钮文字颜色(选中模式)
 @param normalBackImage  按钮背景图片(普通模式)
 @param selectBackImage  按钮被禁图片(选中模式)
 @param titleFont        按钮字体大小
 
 @return 返回的按钮
 */
+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                     selectTitle:(NSString *)selectTitle
                selectTitleColor:(UIColor *)selectTitleColor
                 normalBackImage:(UIImage *)normalBackImage
                 selectBackImage:(UIImage *)selectBackImage
                       titleFont:(CGFloat )titleFont;

/**
 返回一个详细设置的Btn
 
 @param normaLTitle       按钮文字(普通模式)
 @param normalTitleColor 按钮文字颜色(普通模式)
 @param selectTitle      按钮文字(选中模式)
 @param selectTitleColor 按钮文字颜色(选中模式)
 @param normalImage  按钮图片(普通模式)
 @param selectImage  按钮图片(选中模式)
 @param titleFont        按钮字体大小
 
 @return 返回的按钮
 */
+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                     selectTitle:(NSString *)selectTitle
                selectTitleColor:(UIColor *)selectTitleColor
                     normalImage:(UIImage *)normalImage
                     selectImage:(UIImage *)selectImage
                       titleFont:(CGFloat )titleFont;

@end
