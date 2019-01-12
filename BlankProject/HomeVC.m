//
//  HomeVC.m
//  BlankProject
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "HomeVC.h"
#import "HomeVM.h"


@interface HomeVC ()

@property (nonatomic, strong) HomeVM *viewModel;
@property (nonatomic, strong) UIButton *pushBtn;
@property (nonatomic, strong) UIButton *presentBtn;

@end

@implementation HomeVC
///覆盖父类viewModel,需要添加这一句
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.pushBtn];
    [self.view addSubview:self.presentBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.leftBtn.hidden = YES;
}

#pragma mark  - 绑定ViewModel
- (void)bindViewModel {
    // MARK: 该函数在父类中有实现,用于绑定 ViewModel

    ///RAC下按钮的两种触发方式,视情况选择实现
    ///第一种
    @weakify(self);
    [[self.pushBtn rac_signalForControlEvents:UIControlEventTouchDown]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self);
         [self.viewModel.pushCommon execute:nil];
     }];
    
    //第二种
    self.presentBtn.rac_command = self.viewModel.presentCommon;

}

- (void)layPageSubViews {
    // MARK: 该函数在父类中有实现,可以重写
    
    self.pushBtn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 30)
    .widthIs(80)
    .heightIs(44);
    
    self.presentBtn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.pushBtn, 30)
    .widthIs(100)
    .heightIs(44);
    
}

#pragma mark  - getter and setter

- (UIButton *)pushBtn {
    if (_pushBtn == nil) {
        _pushBtn = [UIButton btnWithNormaLTitle:@"pushBtn"
                               normalTitleColor:ColorTitle
                                      backImage:[UIImage imageWithColor:ColorLightLine]
                                      titleFont:BaseTitleFont];
        
        _pushBtn.layer.cornerRadius = XZLittleSpace;
        _pushBtn.layer.borderColor = ColorGray.CGColor;
        _pushBtn.layer.borderWidth = 1.0f;
        _pushBtn.layer.masksToBounds = YES;
    }
    return _pushBtn;
}

- (UIButton *)presentBtn {
    if (_presentBtn == nil) {
        _presentBtn = [UIButton btnWithNormaLTitle:@"presentBtn"
                               normalTitleColor:ColorTitle
                                      backImage:[UIImage imageWithColor:ColorLightLine]
                                      titleFont:BaseTitleFont];
        
        _presentBtn.layer.cornerRadius = XZLittleSpace;
        _presentBtn.layer.borderColor = ColorGray.CGColor;
        _presentBtn.layer.borderWidth = 1.0f;
        _presentBtn.layer.masksToBounds = YES;
    }
    return _presentBtn;
}

@end
