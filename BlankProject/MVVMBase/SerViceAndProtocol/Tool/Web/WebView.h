//
//  WebView.h
//  TeYouDian
//
//  Created by mac on 17/5/2.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebView : UIView

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, copy)NSString *webUrl;

@end
