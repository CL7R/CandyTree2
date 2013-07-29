//
//  AppInitManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-19.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "AppInitManager.h"
#import "UserInfoManager.h"
#import "ASIFormDataRequest.h"
#import "ServerErrorCode.h"

#define APP_INT_URL URL_MAIN@"InitServlet"

@implementation AppInitManager

#pragma mark -
#pragma mark public

- (ServerErrorCode)startInit
{
    UserInfoManager *userInfo = [UserInfoManager shareInstance];
    
    if (![userInfo isLogined]) {
        return Server_Susccess;
    }
    
    
    NSURL *appInitUrl = [NSURL URLWithString:APP_INT_URL];
    
    ASIFormDataRequest *appInitRequest = [ASIFormDataRequest requestWithURL:appInitUrl];
    
    [appInitRequest setPostValue:[self getAppInitJson:userInfo]
                                 forKey:@"InitInfo"];
    
    [appInitRequest startSynchronous];
    
    NSError *error = [appInitRequest error];
    if (error) {
        NSLog(@"changePassword error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[appInitRequest responseString] JSONValue];
    return [self processInitResult:resultJSON];

}

#pragma mark -
#pragma mark private

- (NSString *)getAppInitJson:(UserInfoManager *)userInfo
{
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSMutableDictionary *changePassInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            userInfo.sessionID, @"SessionID" ,
                                            userInfo.useTime, @"UseTime",
                                            appVersion, @"appVersion",
                                            nil];
    
    
    
    NSLog(@"changePassInfo = %@", [changePassInfo JSONRepresentation]);
    
    return [changePassInfo JSONRepresentation];
}

- (ServerErrorCode)processInitResult:(NSDictionary *)result
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:result];
    
    if (initResult == Server_Susccess) {
        NSDictionary *userInfo = [result objectForKey:@"UserInfo"];
        if (userInfo) {
            [[UserInfoManager shareInstance] processInitInfo:userInfo];
            
            // todo 通知ui
        }
    }
    
    return initResult;
}

@end
