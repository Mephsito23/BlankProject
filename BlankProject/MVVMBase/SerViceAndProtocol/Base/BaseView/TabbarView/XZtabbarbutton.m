//
//  XZtabbarbutton.m
//  mystatus
//
//  Created by pcbeta on 16-2-11.
//  Copyright (c) 2016年 pcbeta. All rights reserved.
//

#import "XZtabbarbutton.h"
//#import "UIImage+XZ.h"
#define buttonHightscale 0.6

@interface XZtabbarbutton()

@end
@implementation XZtabbarbutton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:13];

    }
    return self;
}


-(void)setHighlighted:(BOOL)highlighted{}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat W=contentRect.size.width;
    CGFloat H=contentRect.size.height*buttonHightscale;
    CGFloat Y=0;
    CGFloat X=0;
    return CGRectMake(X, Y, W, H);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat W=contentRect.size.width;
    CGFloat H=contentRect.size.height*(1-buttonHightscale);
    CGFloat Y=contentRect.size.height*buttonHightscale;;
    CGFloat X=0;
    return CGRectMake(X, Y, W, H);
    
}
-(void)setItme:(UITabBarItem *)itme
{
    _itme=itme;
    
    [itme addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [itme addObserver:self forKeyPath:@"title" options:0 context:nil];
    [itme addObserver:self forKeyPath:@"image" options:0 context:nil];
    [itme addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    [self setTitle:self.itme.title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHexString:@"#686868"] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHexString:@"#F7BF56"] forState:UIControlStateSelected];
    [self setImage:self.itme.image forState:UIControlStateNormal];
    [self setImage:self.itme.selectedImage forState:UIControlStateSelected];
}




@end
