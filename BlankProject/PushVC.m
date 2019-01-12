//
//  PushVC.m
//  BlankProject
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PushVC.h"
#import "PushVM.h"
#import "PushMainV.h"


@interface PushVC ()

@property (nonatomic, strong) PushVM *viewModel;
@property (nonatomic, strong) UILabel *descL;
@property (nonatomic, strong) PushMainV *mainV;

@end

@implementation PushVC
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.descL];
    [self.view addSubview:self.mainV];

}

- (void)bindViewModel {
    // MARK: 绑定 ViewModel
    
    ///mainV 需要实现 BindViewModelProtocol 协议
    [self.mainV viewBindViewModel:self.viewModel];

}

- (void)layPageSubViews {
    
    self.descL.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 30)
    .widthIs(300)
    .autoHeightRatio(0);
    
    self.mainV.sd_layout
    .topSpaceToView(self.descL, 30)
    .centerXEqualToView(self.view)
    .widthRatioToView(self.view, 0.8)
    .heightEqualToWidth();
}

#pragma mark  - getter and setter

- (UILabel *)descL {
    if (_descL == nil) {
        NSString *desc = @"该界面实现了在MVVM模式下的, 界面传值,网络请求,更新图片功能:";
        _descL = [UILabel labelWithText:desc font:BaseTitleFont color:ColorTitle];
    }
    return _descL;
}

- (PushMainV *)mainV {
    if (_mainV == nil) {
        _mainV = [[PushMainV alloc]init];
    }
    return _mainV;
}

@end
