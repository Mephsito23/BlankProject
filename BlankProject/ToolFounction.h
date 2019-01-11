//
//  ToolFounction.h
//  Oilb2B_iOS
//
//  Created by mac on 2018/9/25.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolFounction : NSObject

+ (void)popSelectDataView:(UIViewController *)vc
             selectedDate:(void (^)(NSDateComponents * dateComponents))selectedDate;


/**
 打开本地相册
 @param viewController  打开相册控制器
 @param canSelctNumber  能选择的图片个数
 @param selectImage 已选图片个数
 */
+ (void)openLocalPhoto:(UIViewController *)viewController
        canSelctNumber:(NSInteger)canSelctNumber
           selectImage:(void(^)(NSArray<UIImage *> *photos,NSArray *assets))selectImage;

@end

NS_ASSUME_NONNULL_END
