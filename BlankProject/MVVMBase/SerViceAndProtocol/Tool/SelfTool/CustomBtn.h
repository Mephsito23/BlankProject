//
//  CustomBtn.h
//  HoldTheDoll
//
//  Created by mac on 2017/12/21.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonType) {
    ImageViewTop=0,
    ImageViewBottom,
    ImageViewRight
};

@interface CustomBtn : UIButton

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                      btnType:(ButtonType)btnType;


+ (instancetype)btnWithTitle:(NSString *)title
                       image:(UIImage *)image
                     btnType:(ButtonType)btnType;



@end
