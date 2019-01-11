//
//  NSDictionary+Image.h
//  Transportation
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Image)

/**
 获取图片中的EXIF文件和GPS文件
 */
+ (NSDictionary *)xz_dictWithImage:(UIImage *)image;

//+ (UIImage *)xz_changeImageExitWithDict:(NSDictionary *)dic
//                                  image:(UIImage *)image;

@end
