//
//  TwoVC.m
//  BlankProject
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "TwoVC.h"
#import "TwoVM.h"

@interface TwoVC ()

@property (nonatomic, strong) TwoVM *viewModel;
@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;

@end

@implementation TwoVC
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.oneBtn];
    [self.view addSubview:self.twoBtn];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.leftBtn.hidden = YES;
}

- (void)bindViewModel {
    
    self.oneBtn.rac_command = self.viewModel.pushOneVcCommon;
    self.twoBtn.rac_command = self.viewModel.pushTwoVcCommon;
}

- (void)layPageSubViews {
    
    self.oneBtn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 30)
    .widthIs(200)
    .heightIs(44);
    
    self.twoBtn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.oneBtn, 30)
    .widthIs(150)
    .heightIs(44);
}


#pragma mark  - getter and setter

- (UIButton *)oneBtn {
    if (_oneBtn == nil) {
        _oneBtn = [UIButton btnWithNormaLTitle:@"多种类Cell布局TableView"
                               normalTitleColor:ColorTitle
                                      backImage:[UIImage imageWithColor:ColorLightLine]
                                      titleFont:BaseTitleFont];
        
        _oneBtn.layer.cornerRadius = XZLittleSpace;
        _oneBtn.layer.borderColor = ColorGray.CGColor;
        _oneBtn.layer.borderWidth = 1.0f;
        _oneBtn.layer.masksToBounds = YES;
    }
    return _oneBtn;
}

- (UIButton *)twoBtn {
    if (_twoBtn == nil) {
        _twoBtn = [UIButton btnWithNormaLTitle:@"分页请求网络数据"
                              normalTitleColor:ColorTitle
                                     backImage:[UIImage imageWithColor:ColorLightLine]
                                     titleFont:BaseTitleFont];
        
        _twoBtn.layer.cornerRadius = XZLittleSpace;
        _twoBtn.layer.borderColor = ColorGray.CGColor;
        _twoBtn.layer.borderWidth = 1.0f;
        _twoBtn.layer.masksToBounds = YES;
    }
    return _twoBtn;
}


@end
