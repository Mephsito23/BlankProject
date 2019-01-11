//
//  UITextField+Creat.m
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UITextField+Creat.h"

@implementation UITextField (Creat)

+ (UITextField *)textFiedWithPlaceholder:(NSString *)placeholder
                                   space:(CGFloat)space
                         backgroundColor:(UIColor *)backgroundColor
                                textFont:(CGFloat)textFont{
    UITextField *passWordTF=[UITextField new];
    passWordTF.font=[UIFont systemFontOfSize:textFont];
    passWordTF.placeholder=placeholder;
    passWordTF.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, space, 10)];
    passWordTF.leftViewMode=UITextFieldViewModeAlways;
    passWordTF.backgroundColor=backgroundColor;
    passWordTF.layer.masksToBounds=YES;
    return passWordTF;
}


@end
