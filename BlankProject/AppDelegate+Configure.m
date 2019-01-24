//
//  AppDelegate+Configure.m
//  Oilb2B_iOS
//
//  Created by mac on 2018/1/20.
//  Copyright © 2018年 Mephsito. All rights reserved.
//

#import "LCNetworkConfig.h"
#import "AppDelegate+Configure.h"
#import "HQLCustomFormatter.h"
#import "XZProcessFilter.h"


@implementation AppDelegate (Configure)

- (void)configureLog{
    
    [DDTTYLogger sharedInstance].logFormatter = [[HQLCustomFormatter alloc] init]; // 自定义日志
    // DDTTYLogger，你的日志语句将被发送到Xcode控制台
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // DDASLLogger，你的日志语句将被发送到苹果文件系统、你的日志状态会被发送到 Console.app
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    // DDFileLogger，你的日志语句将写入到一个文件中，默认路径在沙盒的Library/Caches/Logs/目录下，文件名为bundleid+空格+日期.log。
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 刷新频率为24小时
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // 保存一周的日志，即7天
    [DDLog addLogger:fileLogger];
    
    // 产生Log
    DDLogVerbose(@"Verbose");   // 详细日志
    DDLogDebug(@"Debug");       // 调试日志
    DDLogInfo(@"Info");         // 信息日志
    DDLogWarn(@"Warn");         // 警告日志
    DDLogError(@"Error");       // 错误日志
    
    
}

- (void)configureNetWorking {
    
    NSString *baseUrl = @"";
    NSString *viceBaseUrl = @"";
    
#ifdef DEBUG
    baseUrl = kDebugBaseURL;
    viceBaseUrl = kDebugViceBaseURL;
#else
    baseUrl = BASEURL;
    viceBaseUrl = VICEBASEURL;
#endif
    
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    config.mainBaseUrl = baseUrl;
    config.viceBaseUrl = viceBaseUrl;
    XZProcessFilter *filter = [[XZProcessFilter alloc]init];
    
    DDLogDebug(@"%@", config);
    
    config.processRule = filter;
}


- (void)configureKeyboardManager {
    IQKeyboardManager.sharedManager.enableAutoToolbar = YES;
    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
    IQKeyboardManager.sharedManager.toolbarDoneBarButtonItemText = @"完成";
}


@end
