//
//  XZmytabbar.h
//  mystatus
//
//  Created by pcbeta on 16-2-11.
//  Copyright (c) 2016年 pcbeta. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^btnWillSelect)(UIButton *btn);

@class XZmytabbar;
@protocol XZmytabbarDelegate <NSObject>
@optional

-(void)tabbarButton:(XZmytabbar*)tabbar
               from:(NSInteger )from
                 to:(NSInteger)to;

-(void)tabbarButton:(XZmytabbar*)tabbar
             addBtn:(UIButton *)addBtn
               from:(NSInteger )from
                 to:(NSInteger)to;


-(void)addbuttonDidclick:(XZmytabbar*)tabbar;
@end

@interface XZmytabbar : UIView
@property(nonatomic,weak)id <XZmytabbarDelegate> xzMyTabbarDelegate;

@property (nonatomic, copy) btnWillSelect btnSelct;

-(void)addTabbarButton:(UITabBarItem*)itme;

- (void)firstBtnDidSelect;

- (void)setSelectBtnWithIndex:(NSInteger )index;

@end
