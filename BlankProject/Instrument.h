//
//  Instrument.h
//  Oilb2B_iOS
//
//  Created by mac on 2018/1/20.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

///---------
///工具常量宏
///---------

#ifndef Instrument_h
#define Instrument_h

///---------
/// App Info
///---------
#define NavTempApplicationVersionKey @"NavTempApplicationVersionKey"
#define MRC_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define MRC_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define MRC_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

///-----
/// Tool
///-----
#define XZdefaults  [NSUserDefaults standardUserDefaults]
#define XZNotificationCenter [NSNotificationCenter defaultCenter]

///-----------------------
///字体全局定义方法和定义的字体
///-----------------------
#define XZFont(a) [UIFont systemFontOfSize:a]
#define contentFont ((kScreenWidth>=375)?14:13)

///-----------
///屏幕宽度和高度
///-----------
#define kScreenBound [UIScreen mainScreen].bounds
//#define kNavBarSpace (IS_IPHONE_X ? 88 :64)


///----
/// 函数
///----


//创建自定义 View
#define LazyLoadCustomView(ClassName, variable) \
- (ClassName *)variable {  \
if (_##variable == nil) {  \
_##variable = [ClassName new];  \
}  \
return _##variable; \
}

//创建按钮标题和图片
#define LazyLoadBtnHaveTitleAndImage(variable, ImageNameStr, TitleStr, TitleColor, TitleFont) \
- (UIButton *)variable {      \
if (_##variable == nil) {       \
_##variable = [UIButton btnWithNormaLTitle:TitleStr  \
normalTitleColor:TitleColor    \
normalImage:[UIImage imageNamed:ImageNameStr]   \
titleFont:TitleFont];    \
}     \
return _##variable;   \
}


//创建按钮图片
#define LazyLoadBtnOnlyHaveImage(variable, ImageNameStr) \
- (UIButton *)variable {  \
if (_##variable == nil) {  \
_##variable = [UIButton btnWithNormaLTitle:nil  \
normalTitleColor:nil   \
normalImage:[UIImage imageNamed:ImageNameStr]   \
titleFont:2];   \
}  \
return _##variable;  \
}



///懒加载Label
#define LazyLoadLabel(variable, title, titleFont, textColor)    \
-(UILabel *)variable {   \
if (_##variable == nil) { \
_##variable = [UILabel labelWithText:title font:titleFont color:textColor]; \
}\
return _##variable;\
}

///懒加载Label(文字方向)
#define LazyLoadLabelTwo(variable, title, titleFont, textColor, Alignment)    \
-(UILabel *)variable {   \
if (_##variable == nil) { \
_##variable = [UILabel labelWithText:title font:titleFont color:textColor]; \
_##variable.textAlignment = Alignment; \
}\
return _##variable;\
}


///懒加载ImageView
#define LazyLoadImageView(variable, ImageNameStr)\
- (UIImageView *)variable { \
if (_##variable == nil) {  \
_##variable = [UIImageView new];  \
_##variable.contentMode = UIViewContentModeScaleAspectFill;  \
_##variable.layer.masksToBounds = YES; \
if ([ImageNameStr isNotBlank]) _##variable.image=[UIImage imageNamed:ImageNameStr]; \
}  \
return _##variable;  \
}

///懒加载ImageView(切角)
#define LazyLoadImageViewRadius(variable, ImageNameStr, Radius)\
- (UIImageView *)variable { \
if (_##variable == nil) {  \
_##variable = [UIImageView new];  \
_##variable.contentMode = UIViewContentModeScaleAspectFill;  \
_##variable.layer.cornerRadius=(Radius); \
_##variable.layer.masksToBounds = YES; \
if ([ImageNameStr isNotBlank]) _##variable.image=[UIImage imageNamed:ImageNameStr]; \
}  \
return _##variable;  \
}

///懒加载 RACsubject
#define LazyLoadSubjectMethod(variable)    \
- (RACSubject *)variable {  \
if (_##variable == nil) {   \
_##variable = [RACSubject subject];  \
}   \
return _##variable;    \
}

///懒加载可变数组
#define LazyLoadMethod(variable)    \
- (NSMutableArray *)variable \
{   \
if (!_##variable)  \
{   \
_##variable = [NSMutableArray array];  \
}   \
return _##variable;    \
}



///---------
/// DEBUG打印
///---------

#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


#else

#define NSLog(...)

#endif


#endif /* Instrument_h */
