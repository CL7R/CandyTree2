//
//  UserGrowingManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-29.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "UserGrowingManager.h"
#import "UserInfoManager.h"
#import "ServerErrorCode.h"

#define GET_DATE_URL    URL_MAIN@"GetLoginDateServlet"
#define GET_LEVEL_URL   URL_MAIN@"GetUserLeverServlet"

typedef enum requestType {
    requestType_date  = 1,
    requestType_level = 2
}requestType;

@interface UserGrowingManager ()

@property(nonatomic, retain)JSONHttpRequest *dateRequest;
@property(nonatomic, retain)JSONHttpRequest *levelRequest;

@end


@implementation UserGrowingManager

#pragma mark -
#pragma mark public

- (id)init
{
    if (self = [super init]) {
        self.dateRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_date)
    {
        return GET_DATE_URL;
    }

    return GET_LEVEL_URL;
    
}
- (NSString *)getPostJSON:(id)userData
{
    NSMutableDictionary *getLoginDateInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                              [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                              nil];
    
    
    
    NSLog(@"getLoginDateInfo = %@", [getLoginDateInfo JSONRepresentation]);
    
    return [getLoginDateInfo JSONRepresentation];
    
}
- (NSString *)getPostKey:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_date)
    {
        return @"GetLoginDate";
    }
    
    return @"SessionID";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    
    if (initResult == Server_Susccess) {
        requestType type = [userData intValue];
        if (type == requestType_date)
        {
            NSDictionary *dateInfo = [resultJSON objectForKey:@"dateArrayInfo"];
            if (dateInfo) {
               
            }
        }else{
            NSDictionary *levelInfo = [resultJSON objectForKey:@"leveInfo"];
            if (levelInfo) {
                _level = [[levelInfo objectForKey:@"leveInfo"] intValue];
            }
        }
    }
    
    return initResult;
}


#pragma mark -
#pragma mark private

- (void)dealloc
{
    self.dateRequest    = nil;
    self.levelRequest   = nil;
    
    [super dealloc];
}


@end
