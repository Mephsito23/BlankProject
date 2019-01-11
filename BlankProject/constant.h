//
//  constant.h
//  Oilb2B_iOS
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#ifndef constant_h
#define constant_h


///---------------------
///颜色全局定义方法和静态颜色
///---------------------
#define XZColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define XZColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define ColorTitle [UIColor blackColor]

#define ColorContentGray [UIColor colorWithHexString:@"#8B97A3"]

#define ColorPermissionGray ColorGray

#define ColorContentRed [UIColor colorWithHexString:@"ff0000"]

#define ColorLightLine [UIColor colorWithHexString:@"#eeeff0"]

#define ColorNavTitle ColorWhite

#define ColorMain [UIColor colorWithHexString:@"#3e3f40"]

#define ColorYellow [UIColor colorWithHexString:@"#fcc049"]

#define ColorNav ColorMain

#define ColorLine XZColor(208, 208, 208)

#define ColorBG [UIColor colorWithHexString:@"#f1f1f1"]

#define BaseViewBG [UIColor whiteColor]

#define ColorWhite [UIColor whiteColor]

#define ColorGray [UIColor grayColor]


#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define colorI3 0x4183C4

///------
///设备判断
///------

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

//iPhoneX系列
#define kHeight_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define kNavBarSpace ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES  || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define kHeight_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES ||  IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)



#endif /* constant_h */
