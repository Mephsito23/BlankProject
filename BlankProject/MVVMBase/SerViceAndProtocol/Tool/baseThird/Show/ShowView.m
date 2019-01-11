//
//  ShowView.m
//  TeYouDian
//
//  Created by mac on 17/1/20.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "ShowView.h"

@interface ShowView()


@end

@implementation ShowView

static const CGFloat animaintTime = 0.01f;


#pragma mark  - 设置 content
-(UIView *)contentView{
    
    if (!_contentView) {
        
        _contentView = [UIView new];
        _contentView.backgroundColor =[UIColor whiteColor];
        
    }
    
    UIView *keyWindow = [UIApplication sharedApplication].keyWindow.rootViewController.view;
    [keyWindow addSubview:_contentView];

    return _contentView;
}


#pragma mark  - getter and setter

//懒加载 遮罩视图
-(UIView *)shadowView{
    if (!_shadowView) {
        //初始化遮罩视图
        _shadowView = [[UIView alloc]initWithFrame:self.bounds];
        _shadowView.hidden = YES;//默认隐藏
//        _shadowView.backgroundColor = [UIColor blackColor];
//        _shadowView.alpha=0.73;
        
        UIView *keyWindow = [UIApplication sharedApplication].keyWindow.rootViewController.view;
        UIImage *image=[keyWindow snapshotImage];
        _shadowView.backgroundColor=[UIColor colorWithPatternImage:image];
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = CGRectMake(0, 0, _shadowView.frame.size.width, _shadowView.frame.size.height);
        [_shadowView addSubview:effectView];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadowViewHidden)];
        [_shadowView addGestureRecognizer:tap];
        [self addSubview:_shadowView];
    }
    return _shadowView;
}

//点击事件 隐藏遮罩视图
- (void)shadowViewHidden{
    _show = !_show;
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
  
    //原动画
    [UIView animateWithDuration:animaintTime animations:^{
        
        self.contentView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        self.contentView.hidden = YES;
        self.shadowView.hidden = YES;//隐藏
        self.hidden = YES;
        
    }] ;
}

//是否显示
- (void)showOrHidden{
    
    _show = !_show;
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    if (self.isShow == YES) {//添加遮罩视图
        
        UIView *keyWindow = [UIApplication sharedApplication].keyWindow.rootViewController.view;
        [keyWindow addSubview:self];
        
        self.hidden = NO;
        self.contentView.hidden = NO;
        [UIView animateWithDuration:animaintTime animations:^{
            self.shadowView.hidden = NO;//显示
            [self bringSubviewToFront:self.contentView];
        }];
        
    }
    if (self.isShow == NO) {
        
        [self.contentView endEditing:YES];
        
        [UIView animateWithDuration:animaintTime animations:^{
            
            self.contentView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            self.contentView.hidden = YES;
            self.shadowView.hidden = YES;//隐藏
            self.hidden = YES;
            
        }] ;
    }
}



@end
