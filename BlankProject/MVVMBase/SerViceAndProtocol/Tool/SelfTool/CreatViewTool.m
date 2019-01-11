//
//  CreatViewTool.m
//  TVRecharge
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "CreatViewTool.h"

@implementation CreatViewTool

+ (UITextField *)creatTextFiedWithPlaceholder:(NSString *)placeholder
                                        space:(CGFloat)space
                              backgroundColor:(UIColor *)backgroundColor
                                     textFont:(CGFloat)textFont{
    
    UITextField *passWordTF=[UITextField new];
    passWordTF.font=XZFont(textFont);
    passWordTF.placeholder=placeholder;
    passWordTF.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, space, 10)];
    passWordTF.leftViewMode=UITextFieldViewModeAlways;
    passWordTF.backgroundColor=backgroundColor;
//    passWordTF.layer.cornerRadius=5;
//    passWordTF.layer.borderColor=ColorLine.CGColor;
//    passWordTF.layer.borderWidth=1;
    passWordTF.layer.masksToBounds=YES;
    return passWordTF;
}


+ (XTPopView *)creatPopViewWithArr:(NSArray *)arr row:(NSInteger )row{
    
    CGPoint point = CGPointMake(kScreenWidth-XZSpace-XZLittleSpace,44);
    CGFloat width =140;
    if (kScreenWidth>375)width =150;
    
    XTPopView *view1 = [[XTPopView alloc]
                        initWithOrigin:point
                        Width:width
                        Height:40*row
                        Type:XTTypeOfUpRight
                        Color:[UIColor whiteColor]];
    
    view1.layer.cornerRadius=10;
    view1.clipsToBounds = YES;
    view1.dataArray =arr;
    view1.fontSize = 13;
    
    if (kScreenWidth>=375)  view1.fontSize =14;
    view1.row_height = 40;
    view1.titleTextColor = ColorTitle;
    view1.textAlignment=NSTextAlignmentLeft;
    
    return view1;
}

#pragma mark  - 创建按钮

+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                          selectTitle:(NSString *)selectTitle
                     selectTitleColor:(UIColor *)selectTitleColor
                      normalBackImage:(UIImage *)normalBackImage
                      selectBackImage:(UIImage *)selectBackImage
                            titleFont:(CGFloat )titleFont


{
    UIButton *showBtn=[UIButton new];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setTitle:selectTitle forState:UIControlStateSelected];
    [showBtn setTitleColor:selectTitleColor forState:UIControlStateSelected];
    [showBtn setBackgroundImage:selectBackImage forState:UIControlStateSelected];
    
    [showBtn setBackgroundImage:normalBackImage forState:UIControlStateNormal];
    
    showBtn.titleLabel.font=XZFont(titleFont);
    return showBtn;
}

+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                          selectTitle:(NSString *)selectTitle
                     selectTitleColor:(UIColor *)selectTitleColor
                          normalImage:(UIImage *)normalImage
                          selectImage:(UIImage *)selectImage
                            titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton new];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setTitle:selectTitle forState:UIControlStateSelected];
    [showBtn setTitleColor:selectTitleColor forState:UIControlStateSelected];
    
    [showBtn setImage:selectImage forState:UIControlStateSelected];
    [showBtn setImage:normalImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=XZFont(titleFont);
    return showBtn;
    
}


+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                          normalImage:(UIImage *)normalImage
                            titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton new];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setImage:normalImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=XZFont(titleFont);
    return showBtn;
    
}

+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                            backImage:(UIImage *)backImage
                            titleFont:(CGFloat )titleFont{
    
    UIButton *showBtn=[UIButton new];
    [showBtn setTitle:normaLTitle forState:UIControlStateNormal];
    [showBtn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [showBtn setBackgroundImage:backImage forState:UIControlStateNormal];
    showBtn.titleLabel.font=XZFont(titleFont);
    return showBtn;
    
}

#pragma mark  -  创建一个 Label
+(UILabel *)createLabelWithText:(NSString*)title font:(CGFloat)font color:(UIColor*)color
{
    UILabel*label=[UILabel new];
    label.textColor=color;
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:font];
    label.text=title;
    label.numberOfLines=0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    return label;
}

+(UIView *)returnNavBottomLine:(UIView *)view
{
    UIView*line=[[UIView alloc]initWithFrame:CGRectMake(0, 65, kScreenWidth, 1)];
    line.backgroundColor=ColorLine;
    [view addSubview:line];
    
    return line;
}

+ (NSArray *)configureNavbarLocation:(CGFloat )x
                                 btn:(UIButton *)btn{
    
    UIBarButtonItem *rightButon = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *fixedButton_right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedButton_right.width = x;
    return @[fixedButton_right, rightButon];
}

+ (UIAlertController  *)alertControllerVCWithTipMessage:(NSString *)tipMessaeg
                                        okBtnClickBlock:(nullable void (^)(UIAlertAction * action))okBtnClickBlock
                                         cancelBtnClick:(nullable void (^)(UIAlertAction * action))cancelBtnClick{
    
    UIAlertController *tipVC=[UIAlertController alertControllerWithTitle:tipMessaeg
                                                                 message:nil
                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okBtn=[UIAlertAction actionWithTitle:@"确定"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
                                                    okBtnClickBlock(action);
                                                }];
    
    UIAlertAction *cancleBtn=[UIAlertAction actionWithTitle:@"取消"
                                                      style:UIAlertActionStyleCancel
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        cancelBtnClick(action);
                                                    }];
    [tipVC addAction:okBtn];
    [tipVC addAction:cancleBtn];
    return tipVC;
}

@end
