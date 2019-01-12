//
//  PushMainV.m
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PushMainV.h"
#import "PushVM.h"
#import "ImageBean.h"


@interface PushMainV ()

@property (nonatomic, strong) PushVM *viewModel;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIImageView *userV;
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UIButton *changeBtn;

@end

@implementation PushMainV

- (instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        [self creatSubViews];
    }
    return self;
}

//BindViewModelProtocol 方法
- (void)viewBindViewModel:(PushVM *)viewModel{
    self.viewModel = viewModel;
    
    self.changeBtn.rac_command = self.viewModel.getRandomImageCommon;
    
    @weakify(self);
    [[RACObserve(viewModel, model)ignore:nil]
     subscribeNext:^(ImageBean *model) {
         @strongify(self);
         [self.iconV sd_setImageWithURL:[NSURL URLWithString:model.urls.regular]];
         [self.userV sd_setImageWithURL:[NSURL URLWithString:model.user.profileImage.small]];
         self.titleL.text = [NSString stringWithFormat:@"图片作者是:%@", model.user.first_name];
     }];
    
}

- (void)creatSubViews{
    
    [self addSubview:self.titleL];
    [self addSubview:self.userV];
    [self addSubview:self.changeBtn];
    [self addSubview:self.iconV];
    
    self.iconV.image = [UIImage imageWithColor:UIColor.yellowColor];
    self.userV.image = [UIImage imageWithColor:UIColor.redColor];
    
    [self layoutPageSubViews];
}

- (void)layoutPageSubViews{
    
    self.userV.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .widthIs(40)
    .heightEqualToWidth();

    ///该布局可以实现单行UILabel随文字自适应宽度,最大宽度为300
    self.titleL.sd_layout
    .leftSpaceToView(self.userV, XZSpace)
    .topEqualToView(self.userV)
    .heightIs(20);
    [self.titleL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.changeBtn.sd_layout
    .rightEqualToView(self)
    .topEqualToView(self)
    .widthIs(80)
    .heightIs(44);
    
    self.iconV.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.changeBtn, 20)
    .heightIs(300)
    .widthEqualToHeight();
    
    
    
}

#pragma mark  - getter and setter

LazyLoadLabel(titleL, @"图片作者:", contentFont, ColorTitle)
LazyLoadImageView(iconV, kPlaceholderImage)
LazyLoadImageView(userV, kPlaceholderImage)

- (UIButton *)changeBtn {
    if (_changeBtn == nil) {
        _changeBtn = [UIButton btnWithNormaLTitle:@"换一个"
                                 normalTitleColor:ColorTitle
                                        backImage:[UIImage imageWithColor:ColorLightLine]
                                        titleFont:BaseTitleFont];
        
        _changeBtn.layer.cornerRadius = XZLittleSpace;
        _changeBtn.layer.borderColor = ColorGray.CGColor;
        _changeBtn.layer.masksToBounds = YES;
    }
    return _changeBtn;
}


@end
