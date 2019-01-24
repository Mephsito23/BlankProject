//
//  SystemManager.h
//  XZToolFrameWork
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 zefuXie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SystemManager : NSObject

/**
 打开相机判断
 
 @return 返回判断结果 YES:打开 NO:关闭
 */
+ (BOOL)isCameraCanOpen;

/**
 判断定位权限是否开启
 
 @return 返回判断结果 YES:打开 NO:关闭
 */
+ (BOOL)isOpenLocationPermissions;

/**
 应用是否打开了了通知
 
 @return YES 允许  NO 不允许
 */
+ (BOOL)isCanOpenNotifiction;

/**
 打开相机
 
 @param delegate  代理
 @return 相机控制器
 */
+(UIImagePickerController *)openTakePhoto:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)delegate;


@end
