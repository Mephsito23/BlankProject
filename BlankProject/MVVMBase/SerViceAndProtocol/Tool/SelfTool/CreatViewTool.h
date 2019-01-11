//
//  CreatViewTool.h
//  TVRecharge
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTPopView.h"

@interface CreatViewTool : NSObject

/**
 创建一个 TextField
 
 @param placeholder      占位文字
 @param space           距边框间距
 @param backgroundColor 背景颜色
 @param textFont 字体大小
 
 @return 返回的 textfield
 */
+ (UITextField *)creatTextFiedWithPlaceholder:(NSString *)placeholder
                                        space:(CGFloat)space
                              backgroundColor:(UIColor *)backgroundColor
                                     textFont:(CGFloat)textFont;


/**
 创建一个提示的弹框控制器
 
 @param tipMessaeg      提示语句
 @param okBtnClickBlock 确定按钮点击事件
 @param cancelBtnClick  取消按钮点击事件
 
 @return 返回提示控制器
 */
+ (UIAlertController  *)alertControllerVCWithTipMessage:(NSString *)tipMessaeg
                                        okBtnClickBlock:(void (^)(UIAlertAction * action))okBtnClickBlock
                                         cancelBtnClick:(void (^)(UIAlertAction * action))cancelBtnClick;


/**
 创建一个弹框视图
 
 @param arr 标题数组
 @param row 显示个数
 
 @return 返回的弹框
 */
+ (XTPopView *)creatPopViewWithArr:(NSArray *)arr row:(NSInteger )row;

#pragma mark  - 创建按钮
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
+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
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
+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                          selectTitle:(NSString *)selectTitle
                     selectTitleColor:(UIColor *)selectTitleColor
                          normalImage:(UIImage *)normalImage
                          selectImage:(UIImage *)selectImage
                            titleFont:(CGFloat )titleFont;



/**
 返回一个带标题和图片的 Btn
 @param normaLTitle      按钮文字
 @param normalTitleColor 按钮文字颜色
 @param normalImage      按钮图片(普通模式)
 @param titleFont        按钮字体
 
 @return 返回的按钮
 */
+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
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
+ (UIButton *)creatBtnWithNormaLTitle:(NSString *)normaLTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                            backImage:(UIImage *)backImage
                            titleFont:(CGFloat )titleFont;


#pragma mark  -  创建一个 Label
/**
 创建一个 Label
 
 @param title Label的标题
 @param font  Label 的字体大小
 @param color  Label 的字体颜色
 
 @return 生成的 Label
 */
+(UILabel *)createLabelWithText:(NSString*)title font:(CGFloat)font color:(UIColor*)color;


/**
 返回一个 nav 底部的线
 
 @param view  self.view
 
 @return line
 */
+(UIView*)returnNavBottomLine:(UIView*)view;


/**
 更改 nav 的位置
 
 @param x   改变的位置大小
 @param btn 要改变的按钮
 
 @return 返回的 navbarArr
    self.navigationItem.rightBarButtonItems =return
 */
+ (NSArray *)configureNavbarLocation:(CGFloat )x
                                 btn:(UIButton *)btn;

@end
