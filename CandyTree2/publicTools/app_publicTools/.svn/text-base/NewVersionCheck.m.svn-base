//
//  NewVersionCheck.m
//  dbc2
//
//  Created by CL7RNEC on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NewVersionCheck.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "TKAlertCenter.h"
#import "JSON.h"
#import "PublicAll.h"

#define  version  21

@interface NewVersionCheck ()

@end

@implementation NewVersionCheck

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark other
/*
-(void)checkVersionForSc{
    //调用后台服务
    NSURL *url=[NSURL URLWithString:URL_VERSION_SERVLET];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    NSString *strJson=[[[NSString alloc]initWithFormat:@"{\"userid\":\"%d\",\"localVersion\":\"%d\"}",userID,version]autorelease];
    //基础参数
    [request setPostValue:strJson forKey:@"currentVersion"];
    //硬件信息
    [request setPostValue:[PublicDevice getDeviceInfo] forKey:@"deviceInfo"];
    //超时设置，超过5秒取消响应
    [request setTimeOutSeconds:timeOut];
    //异步设置
    [request startSynchronous];
    NSError *error=[request error];
    CLog(@"\n[checkVersionForSc-2]%@",error);
    if(error==nil){
        error=NO;
    }
    //如果没有返回错误
    if (!error) {
        NSString *response=[request responseString];
        CLog(@"\n[checkVersionForSc-3]%@",response);
        NSDictionary *dic=[response JSONValue];
        if([[dic objectForKey:@"resultFlag"]intValue]==1){
            if([[dic objectForKey:@"uptodate"]intValue]==1){  //最新版本
                [[TKAlertCenter defaultCenter] postAlertWithMessage:NSLocalizedString(@"versionNew", nil)];
            }
            else{   //可以升级
                [[NSNotificationCenter defaultCenter] postNotificationName:@"newVersionAlert" object:dic];
            }
        }
        else{
            [[TKAlertCenter defaultCenter] postAlertWithMessage:NSLocalizedString(@"versionError", nil)];
        }
    }
    else{
        [[TKAlertCenter defaultCenter] postAlertWithMessage:NSLocalizedString(@"versionError", nil)];
    }
}
-(void)checkVersionForAsc{
    CLog(@"\n[checkVersionForAsc-1]");
    //调用后台服务
    NSURL *url=[NSURL URLWithString:URL_VERSION_SERVLET];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    NSString *strJson=[[[NSString alloc]initWithFormat:@"{\"userid\":\"%d\",\"localVersion\":\"%d\"}",userID,version]autorelease];
    //基础参数
    [request setPostValue:strJson forKey:@"currentVersion"];
    //硬件信息
    [request setPostValue:[PublicDevice getDeviceInfo] forKey:@"deviceInfo"];
    //超时设置，超过5秒取消响应
    [request setTimeOutSeconds:timeOut];
    [request setDidFinishSelector:@selector(requestFinishedVersion:)];
    [request setDidFailSelector:@selector(requestFailedVersion:)];
    [request setDelegate:self];
    [request setValidatesSecureCertificate:NO];
    //异步设置
    [request startAsynchronous];
}
-(void)requestFinishedVersion:(ASIHTTPRequest *)request{
    NSString *response=[request responseString];
    CLog(@"\n[requestFinishedVersion-1]%@",response);
    NSDictionary *dic=[response JSONValue];
    if([[dic objectForKey:@"resultFlag"]intValue]==1){
        if([[dic objectForKey:@"uptodate"]intValue]!=1){  //检测到最新版本
            [[NSNotificationCenter defaultCenter] postNotificationName:@"newVersionAlert" object:dic];
        }
    }
}
-(void)requestFailedVersion:(ASIHTTPRequest *)request{
    NSError *erroe=[request error];
    CLog(@"\n[requestFailedVersion-1]%@",erroe);
}
-(void)newVersionAlert:(NSNotification *)noti{
    NSDictionary *dic=[noti object];
    UIAlertView *alert=[[[UIAlertView alloc]initWithTitle:NSLocalizedString(@"检测到新版本", nil) message:[dic objectForKey:@"remark"] delegate:self cancelButtonTitle:NSLocalizedString(@"升级", nil) otherButtonTitles:nil]autorelease];
    [alert addButtonWithTitle:NSLocalizedString(@"稍后", nil)];
    [alert addButtonWithTitle:NSLocalizedString(@"不再提示", nil)];
    [alert show];
}
*/
#pragma mark alert
/*
-(void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.5idache.com/CarPickServer/AppStore"]];
    }
    if (buttonIndex==2) {
        //当前版本不再提示
        [PublicDao getFileData:dataFile_main];
        [dicFileData setObject:@"1" forKey:@"checkVersion"];
        [PublicDao saveFile];
    }
}
 */
@end
