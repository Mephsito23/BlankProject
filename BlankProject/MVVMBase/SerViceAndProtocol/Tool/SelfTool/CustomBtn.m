//
//  CustomBtn.m
//  HoldTheDoll
//
//  Created by mac on 2017/12/21.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "CustomBtn.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface CustomBtn ()

@end

@implementation CustomBtn

static const CGFloat space = 5;

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                      btnType:(ButtonType)btnType{
    
    if (self=[super init]) {
        [self setImage:image forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.imageView.layer.masksToBounds=YES;
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        [self configureFrameWith:btnType];
    }
    return self;
}

+ (instancetype)btnWithTitle:(NSString *)title
                       image:(UIImage *)image
                     btnType:(ButtonType)btnType{
    return [[self alloc]initWithTitle:title image:image btnType:btnType];
}

- (void)configureFrameWith:(ButtonType)btnType{
    
    switch (btnType) {
        case ImageViewTop:{
            
            self.imageView.sd_layout
            .topSpaceToView(self, space)
            .centerXEqualToView(self)
            .widthRatioToView(self, 0.5)
            .heightEqualToWidth();
            
            self.titleLabel.sd_layout
            .topSpaceToView(self.imageView, space)
            .bottomSpaceToView(self, space)
            .leftEqualToView(self)
            .rightEqualToView(self);
        }
            break;
            
        case ImageViewBottom:{
            
            self.imageView.sd_layout
            .bottomSpaceToView(self, space)
            .centerXEqualToView(self)
            .widthRatioToView(self, 0.5)
            .heightEqualToWidth();
            
            self.titleLabel.sd_layout
            .topSpaceToView(self, space)
            .bottomSpaceToView(self.imageView, space)
            .leftEqualToView(self)
            .rightEqualToView(self);
        }
            break;
            
        case ImageViewRight:{

            self.imageView.sd_layout
            .rightSpaceToView(self, space)
            .centerYEqualToView(self)
            .heightRatioToView(self, 0.3)
            .widthEqualToHeight();
            
            self.titleLabel.sd_layout
            .leftSpaceToView(self,space)
            .centerYEqualToView(self)
            .rightSpaceToView(self.imageView, space)
            .heightIs(20);
        }
            break;
            
        default:
            break;
    }
}

@end
