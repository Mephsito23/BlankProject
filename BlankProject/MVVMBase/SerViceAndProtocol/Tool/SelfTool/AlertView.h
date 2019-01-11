//
//  AlertView.h
//  HoldTheDoll
//
//  Created by mac on 2017/12/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAlivcColor [UIColor colorWithRed:123 / 255.0 green:134 / 255.0 blue:252 / 255.0 alpha:1]

@protocol AlivcLiveAlertViewDelegate;

typedef void(^AlertViewBtnClick)(NSInteger buttonIndex);

@interface AlertView : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, weak) id<AlivcLiveAlertViewDelegate> delegate;
@property (nonatomic, copy)AlertViewBtnClick btnClickBlock;

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon message:(NSString *)message delegate:(id<AlivcLiveAlertViewDelegate>)delegate buttonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)showInView:(UIView *)view;

- (void)hide;

@end

@protocol AlivcLiveAlertViewDelegate <NSObject>

- (void)alertView:(AlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
