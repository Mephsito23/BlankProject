//
//  NSDictionary+Image.m
//  Transportation
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "NSDictionary+Image.h"

@implementation NSDictionary (Image)

+ (NSDictionary *)xz_dictWithImage:(UIImage *)image {
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
    
    NSDictionary *imageInfo = (__bridge NSDictionary*)CGImageSourceCopyPropertiesAtIndex(source, 0, NULL);
    
    NSMutableDictionary *metaDataDic = [imageInfo mutableCopy];
    NSMutableDictionary *exifDic =[[metaDataDic objectForKey:(NSString*)kCGImagePropertyExifDictionary]mutableCopy];
    NSMutableDictionary *GPSDic =[[metaDataDic objectForKey:(NSString*)kCGImagePropertyGPSDictionary]mutableCopy];
    
    return @{
             @"exifDic" : (exifDic == nil) ? @{} : exifDic,
             @"GPSDic" : (GPSDic == nil) ? @{} : GPSDic,
                 @"imageInfo" : (imageInfo == nil) ? @{} : imageInfo,
             };
}

//+ (UIImage *)xz_changeImageExitWithDict:(NSDictionary *)dic
//                                  image:(UIImage *)image {
//    
//    NSDictionary *originDict = [self xz_dictWithImage:image];
//    
//    NSMutableDictionary *exifDic = originDict[@"exifDic"];
//
//    [exifDic setObject:[NSNumber numberWithFloat:1234.3] forKey:(NSString *)kCGImagePropertyExifExposureTime];
//    [exifDic setObject:@"SenseTime" forKey:(NSString *)kCGImagePropertyExifLensModel];
//    
//    return  image;
//}

@end
