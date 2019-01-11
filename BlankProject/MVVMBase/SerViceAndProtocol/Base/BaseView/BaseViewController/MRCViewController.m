//
//  MRCViewController.m
//  navBarTemp
//
//  Created by mac on 17/1/11.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MRCViewController.h"
#import "BaseViewModel.h"
#import "RacsignHttpTool.h"

@interface MRCViewController (){
       UIView *_navBackView;
}
@property (nonatomic, strong, readwrite) BaseViewModel *viewModel;

@end

@implementation MRCViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    MRCViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
         [viewController layPageSubViews];
     }];
    
    return viewController;
}

- (MRCViewController *)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        self.navigationItem.title=self.viewModel.title;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.viewModel.viewDidLoadSignal sendNext:nil];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self creatNavBar];
    [self.viewModel.willAppearSignal sendNext:nil];
    self.leftBtn.hidden=NO;
    self.rightBtn.hidden=NO;

    [[RacsignHttpTool checkNetWorkStateRacsignal]
    subscribeNext:^(id  _Nullable x) {
        
    }];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.viewModel.willDisappearSignal sendNext:nil];
    if ([SVProgressHUD isVisible]) [SVProgressHUD dismiss];
    
    // Being popped, take a snapshot
    if ([self isMovingFromParentViewController]) {
        self.snapshot = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //移除原生的tabbar
    [XZNotificationCenter postNotificationName:kDELETETABBARITEMNTF object:nil];
}


- (void)bindViewModel{}
- (void)layPageSubViews{}


- (void)creatNavBar{

    UIBarButtonItem *leftButon = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    UIBarButtonItem *rightButon = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    
    if (@available(iOS 11.0,*)){
        
        self.navigationItem.leftBarButtonItem = leftButon;
        self.navigationItem.rightBarButtonItem = rightButon;
    }else{
        
        UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixedButton.width = -25;
        self.navigationItem.leftBarButtonItems = @[fixedButton, leftButon];
        
        UIBarButtonItem *fixedButton_right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixedButton_right.width = -25;
        self.navigationItem.rightBarButtonItems = @[fixedButton_right, rightButon];
    }
    
    self.leftBtn.rac_command=self.viewModel.backCommon;
}


- (UIButton *)leftBtn{
    if (_leftBtn==nil) {
        _leftBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(0, 0, 60, 44);
        [_leftBtn setTitle:BackBtnImageTitle forState:UIControlStateNormal];
        [_leftBtn setTitleColor:ColorNavTitle forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:BackBtnImageName] forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:NavBtnTitleFont];
        
        _leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    }
    return _leftBtn;
}

- (UIButton *)rightBtn{
    if (_rightBtn==nil) {
        
        _rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(0, 0, 60, 44);
        [_rightBtn setTitleColor:ColorNavTitle forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _rightBtn.contentMode = UIViewContentModeScaleAspectFit;
        
        if (@available(iOS 11.0,*)){
            _rightBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, -15);
        }
    }
    return _rightBtn;
}


@end
