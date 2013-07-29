//
//  PushNotice.m
//  RWX_Passenger
//
//  Created by CL7RNEC on 13-3-21.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "PushNotice.h"
#import "ASIFormDataRequest.h"
#import "PublicAll.h"
#import "JSON.h"
@implementation PushNotice
/*
-(void)sendDeviceToken:(NSString *)deviceToken{
    [deviceToken retain];
    //调用后台服务
    NSURL *url=[NSURL URLWithString:URL_APP_MANAGE_SERVLET];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    //定义url参数
    NSString *strJson=[[[NSString alloc]initWithFormat:@"{\"userid\":\"%d\",\"damIsnotice\":\"1\",\"damIsvoice\":\"1\",\"devicetoken\":\"%@\",\"noDisturb\":\"0\"}",userID,deviceToken]autorelease];
    CLog(@"\n[sendDeviceToken-1]%@", strJson);
    //基础参数
    [request setPostValue:strJson forKey:@"appOption"];
    //硬件信息
    [request setPostValue:[PublicDevice getDeviceInfo] forKey:@"deviceInfo"];
    [request setDelegate:self];
    [deviceToken release];
    //超时设置，超过5秒取消响应
    [request setTimeOutSeconds:timeOut];
    REQUEST_CERTIFICATE
    CLog(@"\n[sendDeviceToken-2]");
    [request setDidFinishSelector:@selector(requestFinishedSend:)];
    [request setDidFailSelector:@selector(requestFailedSend:)];
    CLog(@"\n[sendDeviceToken-3]");
    //异步设置
    [request startAsynchronous];
}
-(void)requestFinishedSend:(ASIHTTPRequest *)request
{
    NSString *response=[request responseString];
    CLog(@"\n[requestFinished-getRouteFrom]%@",response);
}
-(void)requestFailedSend:(ASIHTTPRequest *)request
{
    NSError*error =[request error];
    CLog(@"\n[Talk-requestFailedSend]%@",error);
}
 */
@end
