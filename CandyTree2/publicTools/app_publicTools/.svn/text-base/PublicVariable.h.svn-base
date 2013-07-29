//
//  PublicVariable.h
//  wlan
//
//  Created by cai liang on 11-8-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SCREEN_WIDTH        ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT       ([[UIScreen mainScreen] bounds].size.width)
//公共日志
#ifdef DEBUG
#define CLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define CLog(format, ...)
#endif
//持久文件键值对应
#define DAO_APPUSE          @"appUse"
#define DAO_USERID          @"userID"
#define DAO_VERIFI          @"verifi"           //验证码
#define DAO_VERIFI_DATE     @"verifiDate"       //验证码时间
#define DAO_DEVICE_TOKEN    @"deviceToken"      //推送通知标识
#define DAO_RELEASE_ID      @"releaseID"        //打车流水号
#define DAO_TAXI_INFO       @"taxiInfo"         //响应司机信息
//对于https需要忽略证书验证
#define PRO 0     //1:正式环境
#if PRO
#define REQUEST_CERTIFICATE             [request setValidatesSecureCertificate:NO];
#define URL_SERVE                       @"http://www.andotech.cn:8080/"
#else
#define REQUEST_CERTIFICATE 
#define URL_SERVE                       @"http://www.andotech.cn:8081/"
#endif
//url地址，具体含义参看接口设计文档
#define URL_MAIN                        URL_SERVE@"candytree/rest/"
//定义通知
#define NOTI_MAIN_VIEW          @"mainView"         //主页视图

//变量
extern NSString *weiboID;              //微博id
extern NSString *sessionID;

@interface PublicVariable : NSObject

@end
