//
//  WebVC.m
//  KaoQin
//
//  Created by mac on 16/12/15.
//  Copyright © 2016年 BaiXun. All rights reserved.
//

#import "WebVC.h"
#import "WebViewModel.h"
#import "WebView.h"

@interface WebVC ()

@property (nonatomic, strong) WebViewModel *viewModel;
@property (nonatomic, strong) WebView *webView;


@end

@implementation WebVC

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    self.webView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)bindViewModel{
    self.webView.webUrl=self.viewModel.webUrl;
    
    [[self.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         
         if ([self.webView.wkWebView canGoBack]) {
             [self.webView.wkWebView goBack];
         }else {
             [self.viewModel backFounction];
         }
         
     }];
    
}

- (void)back{
    DDLogDebug(@"aaa");
}

#pragma mark - 初始化wkWebView

- (WebView *)webView{
    
    if (_webView==nil) {
        _webView=[[WebView alloc]initWithFrame:kScreenBound];
    }
    return _webView;
    
}


@end
