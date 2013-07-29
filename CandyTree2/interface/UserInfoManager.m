//
//  UserInfoManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "UserInfoManager.h"
#import "ASIFormDataRequest.h"
#import "ServerErrorCode.h"



#define LOGIN_URL   URL_MAIN@"LoginServlet"
#define REG_URL     URL_MAIN@"RegServlet"
#define LOGOUT_URL  URL_MAIN@"LogOutServlet"
#define CHANGE_PASSWORD_URL URL_MAIN@"ChangePassServlet"


#define USER_DEFAULT_KEY_USER_INFO @"USER_INFO"
#define KEY_USER_NAME   @"USER_NAME"
#define KEY_SESSIONID   @"USER_SESSIONID"
#define KEY_EMAIL       @"USER_EMAIL"
#define KEY_USER_TYPE   @"USER_TYPE"
#define KEY_BG_VERSION  @"BG_VERSION"
#define KEY_CLASS_VERSION   @"CLASS_VERSION"



static UserInfoManager* UserInfoManagerInstance = nil;

@interface UserInfoManager ()
{
    NSMutableDictionary     *bgVersions;
    NSMutableDictionary     *classVersions;
}

@end


@implementation UserInfoManager


#pragma mark -
#pragma mark public method

+ (UserInfoManager *)shareInstance
{
    if (!UserInfoManagerInstance) {
        @synchronized(self)
        {
            if (!UserInfoManagerInstance) {
                UserInfoManagerInstance = [[UserInfoManager alloc] init];
            }
        }
    }
    
    return UserInfoManagerInstance;
}

- (BOOL)isLogined
{
    return self.sessionID.length > 0;
}

- (ServerErrorCode)loginEmail:(NSString *)email AndPassword:(NSString *)password
{
    if (email == nil || password == nil)
    {
        return Server_ParamError;
    }

    NSURL *loginUrl = [NSURL URLWithString:LOGIN_URL];
    
    ASIFormDataRequest *loginRequest = [ASIFormDataRequest requestWithURL:loginUrl];
    [loginRequest setPostValue:[self getLoginJsonEmail:email
                                           andPassword:password]
                        forKey:@"LoginInfo"];
    
    [loginRequest startSynchronous];
    
    NSError *error = [loginRequest error];
    if (error) {
        NSLog(@"login error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[loginRequest responseString] JSONValue];
    ServerErrorCode result = [self processLoginResult:resultJSON];
    
    if (result) {
        _userEmail = [email retain];
    }
    
    return result;
}

- (ServerErrorCode)regEmail:(NSString *)email AndPassword:(NSString *)password AndCode:(NSString *)code
{
    if (email == nil || password == nil)
    {
        return Server_ParamError;
    }
    
    NSURL *regUrl = [NSURL URLWithString:REG_URL];
    
    ASIFormDataRequest *regRequest = [ASIFormDataRequest requestWithURL:regUrl];
    
    [regRequest setPostValue:[self getRegJsonEmail:email
                                       AndPassword:password
                                           AndCode:code]
                        forKey:@"RegInfo"];
    
    [regRequest startSynchronous];
    
    NSError *error = [regRequest error];
    if (error) {
        NSLog(@"reg error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[regRequest responseString] JSONValue];
    return [self processRegResult:resultJSON];
}

- (ServerErrorCode)logOut
{
    NSURL *regUrl = [NSURL URLWithString:LOGOUT_URL];
    
    ASIFormDataRequest *logOutRequest = [ASIFormDataRequest requestWithURL:regUrl];
    
    [logOutRequest setPostValue:[self getLogOutJson]
                      forKey:@"LogOutInfo"];
    
    [logOutRequest startSynchronous];
    
    NSError *error = [logOutRequest error];
    if (error) {
        NSLog(@"login error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[logOutRequest responseString] JSONValue];
    return [self processLogOutResult:resultJSON];
}

- (ServerErrorCode)ChangePasswordEmail:(NSString *)email
                        AndOldPassword:(NSString *)oldPassword
                        andNewPassword:(NSString *)newPassword
{
    if (email == nil || oldPassword == nil || newPassword == nil)
    {
        return Server_ParamError;
    }
    
    NSURL *changePasswrodUrl = [NSURL URLWithString:CHANGE_PASSWORD_URL];
    
    ASIFormDataRequest *changePasswordRequest = [ASIFormDataRequest requestWithURL:changePasswrodUrl];
    
    [changePasswordRequest setPostValue:[self getChangePasswordJsonEmail:email
                                               AndOldPassword:oldPassword
                                               andNewPassword:newPassword]
                      forKey:@"ChangePassInfo"];
    
    [changePasswordRequest startSynchronous];
    
    NSError *error = [changePasswordRequest error];
    if (error) {
        NSLog(@"changePassword error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[changePasswordRequest responseString] JSONValue];
    return [self processRegResult:resultJSON];
}

- (ServerErrorCode)getPassword:(NSString *)email
{
    if (email == nil)
    {
        return Server_ParamError;
    }
    
    NSURL *getPasswrodUrl = [NSURL URLWithString:CHANGE_PASSWORD_URL];
    
    ASIFormDataRequest *getPasswordRequest = [ASIFormDataRequest requestWithURL:getPasswrodUrl];
    
    [getPasswordRequest setPostValue:[self getPasswordJsonEmail:email]
                                 forKey:@"GetPassInfo"];
    
    [getPasswordRequest startSynchronous];
    
    NSError *error = [getPasswordRequest error];
    if (error) {
        NSLog(@"getPassword error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[getPasswordRequest responseString] JSONValue];
    return [self processRegResult:resultJSON];
 
}


- (void)processInitInfo:(NSDictionary *)result
{
    if (result) {
        BOOL isValid = [[result objectForKey:@"IsValid"] boolValue];
        if (!isValid) {
            [self resetUserData];
        }else{
            _userName       = [[result objectForKey:@"userName"] retain];
            _userType        = [[result objectForKey:@""] intValue];
            [self processBGVersion:[[result objectForKey:@"BGVersion"] intValue]];
            [self processClassVersion:[[result objectForKey:@"classVersion"] intValue]];
            
            [self saveUserData];
 
        }
    }
}
#pragma mark -
#pragma mark private method

- (id)init
{
    if (self = [super init]) {
        [self loadUserData];
    }
    
    return self;
}

- (void)resetUserData
{
    [_userName release];
    _userName = nil;
    
    [_sessionID release];
    _sessionID = nil;
    
    _userType    = 0;
    
    [self saveUserData];
}

- (void)loadUserData
{
    NSDictionary *userInfoDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:USER_DEFAULT_KEY_USER_INFO];
    return;
    
    if (userInfoDictionary) {
        _userName   = (NSString *)[[userInfoDictionary objectForKey:KEY_USER_NAME] retain];
        _sessionID  = (NSString *)[[userInfoDictionary objectForKey:KEY_SESSIONID] retain];
        _userEmail   = (NSString *)[[userInfoDictionary objectForKey:KEY_EMAIL] retain];
        _userType    = ((NSNumber *)[userInfoDictionary objectForKey:KEY_USER_TYPE]).intValue;
        
        
        bgVersions = [NSMutableDictionary dictionaryWithDictionary:[userInfoDictionary objectForKey:KEY_BG_VERSION]];
        _bgVersion = [[bgVersions objectForKey:_userName] intValue];
        
        classVersions = [NSMutableDictionary dictionaryWithDictionary:[userInfoDictionary objectForKey:KEY_CLASS_VERSION]];
        _classVersion = [[classVersions objectForKey:_userName] intValue];
        
    }else{
        bgVersions      = [[NSMutableDictionary alloc] initWithCapacity:1];
        classVersions   = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
}

- (void)saveUserData
{
    NSMutableDictionary *userInfoDicktionary = [NSMutableDictionary dictionaryWithCapacity:5];
    
    if (userInfoDicktionary) {
        if (self.userName) {
            [userInfoDicktionary setObject:self.userName forKey:KEY_USER_NAME];
        }
        if (self.sessionID) {
            [userInfoDicktionary setObject:self.sessionID forKey:KEY_SESSIONID];
        }
        if (_userEmail) {
            [userInfoDicktionary setObject:self.sessionID forKey:KEY_EMAIL];
        }
        
        if (bgVersions) {
            [userInfoDicktionary setObject:bgVersions forKey:KEY_BG_VERSION];
        }
        
        if (classVersions) {
            [userInfoDicktionary setObject:classVersions forKey:KEY_CLASS_VERSION];
        }
        
        [userInfoDicktionary setObject:[NSNumber numberWithUnsignedInt:_userType] forKey:KEY_USER_TYPE];
        
        [[NSUserDefaults standardUserDefaults] setObject:userInfoDicktionary forKey:USER_DEFAULT_KEY_USER_INFO];
    }
}

- (NSString *)getLoginJsonEmail:(NSString *)email andPassword:(NSString *)password
{
    NSDictionary *loginInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNull null], @"SessionID" ,
                             email, @"Email",
                             password, @"Password",
                             nil];
    
    return [loginInfo JSONRepresentation];
}

- (NSString *)getRegJsonEmail:(NSString *)email AndPassword:(NSString *)password AndCode:(NSString *)code
{
    NSMutableDictionary *regInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     [NSNull null], @"SessionID" ,
                                     email, @"Email",
                                     password, @"Password",
                                     nil];
    
    
    if (code) {
        [regInfo setObject:code forKey:@"Code"];
    }
    NSLog(@"reg = %@", [regInfo JSONRepresentation]);
    
    return [regInfo JSONRepresentation];
}

- (NSString *)getChangePasswordJsonEmail:(NSString *)email AndOldPassword:(NSString *)oldPassword andNewPassword:(NSString *)newPassword
{
    NSMutableDictionary *changePassInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            _sessionID, @"SessionID" ,
                                            email, @"Email",
                                            oldPassword, @"OldPass",
                                            newPassword, @"NewPass",
                                            nil];
    
    
    
    NSLog(@"changePassInfo = %@", [changePassInfo JSONRepresentation]);
    
    return [changePassInfo JSONRepresentation];
}

- (NSString *)getPasswordJsonEmail:(NSString *)email
{
    NSMutableDictionary *getPassInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            _sessionID, @"SessionID" ,
                                            email, @"Email",
                                            nil];
    
    
    
    NSLog(@"getPassInfo = %@", [getPassInfo JSONRepresentation]);
    
    return [getPassInfo JSONRepresentation];
    
}

- (NSString *)getLogOutJson
{
    NSMutableDictionary *LogOutInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                        _sessionID, @"SessionID",
                                        _userEmail, @"Email",
                                        nil];
    
    return [LogOutInfo JSONRepresentation];
}

- (ServerErrorCode)processLoginResult:(NSDictionary *)result
{
    ServerErrorCode loginResult = [ServerErrorCodeMap getServerErrorCode:result];

    if (loginResult == Server_Susccess) {
        NSDictionary *userInfo = [result objectForKey:@"userInfo"];
        _userName       = [[userInfo objectForKey:@"userName"] retain];
        _userType        = [[userInfo objectForKey:@"userType"] intValue];
        _sessionID      = [[userInfo objectForKey:@"sessionid"] retain];
        [self processBGVersion:[[userInfo objectForKey:@"BGVersion"] intValue]];
        [self processClassVersion:[[userInfo objectForKey:@"classVersion"] intValue]];
        
        [self saveUserData];
    }
    
    return loginResult;
}


- (ServerErrorCode)processRegResult:(NSDictionary *)result
{
    ServerErrorCode regResult = [ServerErrorCodeMap getServerErrorCode:result];
    return regResult;
}

- (ServerErrorCode)processChangePasswordResult:(NSDictionary *)result
{
    ServerErrorCode regResult = [ServerErrorCodeMap getServerErrorCode:result];
    return regResult;
}


- (ServerErrorCode)processLogOutResult:(NSDictionary *)result
{
    ServerErrorCode logOutResult = [ServerErrorCodeMap getServerErrorCode:result];
    
    if (logOutResult == Server_Susccess) {
        [self resetUserData];
    }
    
    return logOutResult;
}



- (void)processBGVersion:(NSInteger)newVersion
{
    if (newVersion != _bgVersion) {
        // todo updage bg
        
        _bgVersion = newVersion;
        [bgVersions setObject:[NSNumber numberWithInt:_bgVersion] forKey:_userName];
    }
    
}

- (void)processClassVersion:(NSInteger)newVersion
{
    if (newVersion != _classVersion) {
        // todo updage class 
        
        _classVersion = newVersion;
        [classVersions setObject:[NSNumber numberWithInt:_classVersion] forKey:_userName];
    }
}

- (void)dealloc
{
    [_userName release];
    [_sessionID release];
    [_userEmail release];
    [bgVersions release];
    [classVersions release];
    
    [super dealloc];
}

@end
