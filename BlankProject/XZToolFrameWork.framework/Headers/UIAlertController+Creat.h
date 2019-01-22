//
//  UIAlertController+Creat.h
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Creat)

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


@end
