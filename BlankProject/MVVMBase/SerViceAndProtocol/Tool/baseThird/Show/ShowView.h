//
//  ShowView.h
//  TeYouDian
//
//  Created by mac on 17/1/20.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowView : UIView

/**内容视图*/
@property (nonatomic, strong)UIView *contentView;

/**是否显示*/
@property (nonatomic,assign,getter=isShow) BOOL show;

/**遮罩视图*/
@property (nonatomic, strong)UIView *shadowView;

//是否显示
- (void)showOrHidden;

@end
