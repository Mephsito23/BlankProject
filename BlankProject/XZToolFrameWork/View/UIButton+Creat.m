//
//  UIButton+Creat.m
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIButton+Creat.h"

@implementation UIButton (Creat)

+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                     normalImage:(UIImage *)normalImage
                       titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setImage:normalImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=[UIFont systemFontOfSize:titleFont];
    return showBtn;
}

+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                       backImage:(UIImage *)backImage
                       titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    if (backImage) [showBtn setBackgroundImage:backImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=[UIFont systemFontOfSize:titleFont];
    return showBtn;
}


+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                     selectTitle:(NSString *)selectTitle
                selectTitleColor:(UIColor *)selectTitleColor
                 normalBackImage:(UIImage *)normalBackImage
                 selectBackImage:(UIImage *)selectBackImage
                       titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setTitle:selectTitle forState:UIControlStateSelected];
    [showBtn setTitleColor:selectTitleColor forState:UIControlStateSelected];
    
    if (selectBackImage) [showBtn setBackgroundImage:selectBackImage forState:UIControlStateSelected];
    if (normalBackImage) [showBtn setBackgroundImage:normalBackImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=[UIFont systemFontOfSize:titleFont];
    return showBtn;
}

+ (UIButton *)btnWithNormaLTitle:(NSString *)normaLTitle
                normalTitleColor:(UIColor *)normalTitleColor
                     selectTitle:(NSString *)selectTitle
                selectTitleColor:(UIColor *)selectTitleColor
                     normalImage:(UIImage *)normalImage
                     selectImage:(UIImage *)selectImage
                       titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setTitle:selectTitle forState:UIControlStateSelected];
    [showBtn setTitleColor:selectTitleColor forState:UIControlStateSelected];
    
    if (selectImage) [showBtn setImage:selectImage forState:UIControlStateSelected];
    if (normalImage) [showBtn setImage:normalImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=[UIFont systemFontOfSize:titleFont];
    return showBtn;

}

@end
