//
//
//  mystatus
//
//  Created by pcbeta on 16-2-11.
//  Copyright (c) 2016年 pcbeta. All rights reserved.
//

#import "XZmytabbar.h"
#import "XZtabbarbutton.h"

@interface XZmytabbar()
@property(nonatomic,strong)XZtabbarbutton*selectedButton;
@property(nonatomic,strong)NSMutableArray*arrayM;

@end
@implementation XZmytabbar

-(NSMutableArray *)arrayM
{
    if (_arrayM==nil) {
        _arrayM=[NSMutableArray array];
    }
    return _arrayM;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)addclick:(UIButton*)button
{
    if ([self.xzMyTabbarDelegate respondsToSelector:@selector(addbuttonDidclick:)]) {
        [self.xzMyTabbarDelegate addbuttonDidclick:self];
    }
}

-(void)addTabbarButton:(UITabBarItem *)itme
{
    XZtabbarbutton*button=[[XZtabbarbutton alloc]init];
    button.itme=itme;
    
    [self addSubview:button];
    [self.arrayM addObject:button];
    //XZLog(@"%@",self.arrayM);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
    
}

- (void)firstBtnDidSelect{
    XZtabbarbutton *button=self.subviews.firstObject;
    [self buttonClick:button];
}

-(void)buttonClick:(XZtabbarbutton*)button{
    
    if ([self.xzMyTabbarDelegate respondsToSelector:@selector(tabbarButton:from:to:)]) {
        
        DDLogDebug(@"%ld --%ld", self.selectedButton.tag, button.tag);
        [self.xzMyTabbarDelegate tabbarButton:self from:self.selectedButton.tag to:button.tag];
    }
    
    if ([self.xzMyTabbarDelegate respondsToSelector:@selector(tabbarButton:addBtn:from:to:)]) {
        [self.xzMyTabbarDelegate tabbarButton:self addBtn:button from:self.selectedButton.tag to:button.tag];
    }

    //按钮状态控制
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}

- (void)setSelectBtnWithIndex:(NSInteger )index{
    
    XZtabbarbutton *btn = self.subviews[index];
    //按钮状态控制
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;

}


-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置frame
    for (int index=0; index<self.arrayM.count; index++) {
        
        XZtabbarbutton*button=self.arrayM[index];
        button.tag=index;
        CGFloat buttonW=self.frame.size.width/self.subviews.count;
        CGFloat buttonH=self.frame.size.height;
        CGFloat buttonX=buttonW*index;
        CGFloat buttonY=0;
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
//        NSLog(@"%@",NSStringFromCGRect(button.frame));
    }
}

@end
