//
//  UIAlertController+Creat.m
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIAlertController+Creat.h"

@implementation UIAlertController (Creat)

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
