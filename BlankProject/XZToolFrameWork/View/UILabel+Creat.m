//
//  UILabel+Creat.m
//  CategoryTool
//
//  Created by mac on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UILabel+Creat.h"

@implementation UILabel (Creat)

+(UILabel *)labelWithText:(NSString*)title font:(CGFloat)font color:(UIColor*)color{
    
    UILabel*label=[UILabel new];
    label.textColor=color;
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:font];
    label.text=title;
    label.numberOfLines=0;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    return label;
}

@end
