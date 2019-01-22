//
//  LYTextView.h
//  lxnxqw
//
//  Created by centling on 16/1/9.
//  Copyright © 2016年 baixun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTextView : UITextView

@property (nonatomic, copy) NSString *placeholder;//占位文字

@property (nonatomic, assign)NSTextAlignment placeolderTextAlignment;

@property (nonatomic, strong) UIColor *placeholderColor;//占位文字的颜色

@property (nonatomic, assign) NSInteger * fontnum;
@end
