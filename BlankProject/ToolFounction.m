//
//  ToolFounction.m
//  Oilb2B_iOS
//
//  Created by mac on 2018/9/25.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import <PGDatePicker/PGDatePickManager.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import "ToolFounction.h"


@implementation ToolFounction

+ (void)popSelectDataView:(UIViewController *)vc
             selectedDate:(void (^)(NSDateComponents * dateComponents))selectedDate {
    
    //弹出日期选择框
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    datePickManager.cancelButtonTextColor = ColorMain;
    datePickManager.confirmButtonTextColor = ColorMain;
    datePickManager.isShadeBackground = true;
    
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.middleTextColor = ColorMain;
    datePicker.textColorOfSelectedRow = ColorMain;
    datePicker.lineBackgroundColor = ColorMain;
    datePicker.datePickerType = PGDatePickerType1;
    datePicker.isHiddenMiddleText = false;
    
    datePicker.datePickerMode = PGDatePickerModeDate;
    [vc presentViewController:datePickManager animated:false completion:nil];
    
    datePicker.selectedDate = ^(NSDateComponents *dateComponents) {
        selectedDate(dateComponents);
    };
}

#pragma mark  - 调用相机或者图片浏览器
///打开本地相册
+ (void)openLocalPhoto:(UIViewController *)viewController
        canSelctNumber:(NSInteger)canSelctNumber
           selectImage:(void(^)(NSArray<UIImage *> *photos,NSArray *assets))selectImage {
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]
                                              initWithMaxImagesCount:canSelctNumber
                                              columnNumber:4
                                              delegate:nil
                                              pushPhotoPickerVc:YES];
    
    UIImage *backImage=[UIImage imageNamed:BackBtnImageName];
    CGSize ImageSize=CGSizeMake(12, 20);
    backImage=[UIImage imageWithImage:backImage scaledToSize:ImageSize];
    [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    imagePickerVc.navigationBar.backIndicatorImage=backImage;
    imagePickerVc.navigationBar.backIndicatorTransitionMaskImage=backImage;
    imagePickerVc.navigationBar.tintColor=ColorWhite;
    
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.showSelectBtn = NO;
    //    imagePickerVc.allowCrop =YES;
    imagePickerVc.naviBgColor=ColorMain;
    imagePickerVc.naviTitleColor=ColorWhite;
    imagePickerVc.oKButtonTitleColorNormal = ColorMain;
    imagePickerVc.barItemTextColor=ColorWhite;
    imagePickerVc.cancelBtnTitleStr = @"取消  ";
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        selectImage(photos, assets);
    }];
    [viewController presentViewController:imagePickerVc animated:YES completion:nil];
}



@end
