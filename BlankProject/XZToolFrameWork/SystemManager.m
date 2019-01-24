//
//  SystemManager.m
//  XZToolFrameWork
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 zefuXie. All rights reserved.
//

#import "SystemManager.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreLocation/CoreLocation.h>

@implementation SystemManager

#pragma mark  - 判断相机是否打开
+(BOOL)isCameraCanOpen{
    
    return ([self isCameraAvailable] &&
            [self doesCameraSupportTakingPhotos])?YES:NO;
}

+ (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
+ (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}


+ (BOOL)isOpenLocationPermissions {
    
    BOOL judge=NO;
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] ==
         kCLAuthorizationStatusAuthorizedWhenInUse||
         [CLLocationManager authorizationStatus] ==
         kCLAuthorizationStatusNotDetermined ||
         [CLLocationManager authorizationStatus] ==
         kCLAuthorizationStatusAuthorizedAlways)) {
            
            //定位功能可用
            judge=YES;
            
        }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
            //定位不能用
            judge=NO;
        }
    return judge;
}

+ (BOOL)isCanOpenNotifiction {
    /*
     settings.types 有以下几种状态
     0 => none                  不允许通知 UIUserNotificationTypeNone
     1 => badge                 只允许应用图标标记 UIUserNotificationTypeBadge
     2 => sound                 只允许声音 UIUserNotificationTypeBadge
     3 => sound + badge         允许声音+应用图标标记
     4 => alert                 只允许提醒 UIUserNotificationTypeAlert
     5 => alert + badge         允许提醒+应用图标标记
     6 => alert + sound         允许提醒+声音
     7 => alert + sound + badge 三种都允许
     */
    UIUserNotificationSettings *settings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    /// YES 允许  NO 不允许
    BOOL isCanNTF = (settings.types == 7) || (settings.types == 6) || ((settings.types == 5)) || (settings.types == 4);
    return isCanNTF;
    
}

+(UIImagePickerController *)openTakePhoto:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)delegate{
    
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([self isCameraCanOpen]) {
        controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    //是否可以编辑
    controller.allowsEditing = YES;
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    controller.mediaTypes = mediaTypes;
    controller.delegate = delegate;
    return controller;
}

@end
