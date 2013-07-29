//
//  UserQAManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-29.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "UserQAManager.h"
#import "UserInfoManager.h"

#define GET_QA_URL URL_MAIN@"getQAServlet"
#define SEND_Q_URL URL_MAIN@"SendQuestionServlet"

typedef enum requestType {
    requestType_get = 1,
    requestType_send = 2
}requestType;

@implementation QAInfo

- (void)dealloc
{
    self.QAID       = nil;
    self.QAParentID = nil;
    self.QAContent  = nil;
    self.QAUser     = nil;
    self.QADate     = nil;
    
    [super dealloc];
    
    
}

@end

@interface UserQAManager ()
@property(nonatomic, retain)JSONHttpRequest *getRequest;
@property(nonatomic, assign)NSInteger fromIndex;
@property(nonatomic, assign)NSInteger toIndex;


@property(nonatomic, retain)QAInfo *sendQAInfo;
@property(nonatomic, retain)JSONHttpRequest *sendRequest;

@end



@implementation UserQAManager

#pragma mark -
#pragma mark public

- (id)init
{
    if (self = [super init]) {
        self.getRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.getRequest.userData = [NSNumber numberWithInt:requestType_get];
        
        self.sendRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.sendRequest.userData = [NSNumber numberWithInt:requestType_send];
        
    }
    
    return self;
}

- (ServerErrorCode)getQAInfoFrom:(NSInteger)fromIndex to:(NSInteger)toIndex
{
    self.fromIndex  = fromIndex;
    self.toIndex    = toIndex;
    [self resetQAInfoArr];
    
    return [self.getRequest start];
}


- (ServerErrorCode)sendQuestion:(QAInfo *)info
{
    self.sendQAInfo    = info;
    [self resetSendResultQAInfo];
    
    return [self.sendRequest start];
}

#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    if ([userData intValue] == requestType_get) {
        return GET_QA_URL;
    }
    
    return SEND_Q_URL;
}
- (NSString *)getPostJSON:(id)userData
{
    
    if ([userData intValue] == requestType_get) {
        NSMutableDictionary *getQAInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                                [NSNumber numberWithInt:self.fromIndex], @"QAStartIndex",
                                                [NSNumber numberWithInt:self.toIndex], @"QAEndIndex",
                                                nil];
        
        
        
        NSLog(@"getQAInfo = %@", [getQAInfo JSONRepresentation]);
        
        return [getQAInfo JSONRepresentation];
    }
    
    
    
    NSMutableDictionary *sendQAInfoDic  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                                nil];
    
    if (self.sendQAInfo.QAContent) {
        [sendQAInfoDic setObject:self.sendQAInfo.QAContent forKey:@"QuestionContent"];
    }
    
    NSLog(@"sendQAInfoDic = %@", [sendQAInfoDic JSONRepresentation]);
    
    return [sendQAInfoDic JSONRepresentation];
    
}
- (NSString *)getPostKey:(id)userData
{
    if ([userData intValue] == requestType_get) {
        return @"GetQAInfo";
    }
    
    return @"SendQuestion";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    
    if (initResult == Server_Susccess) {
        if ([userData intValue] == requestType_get) {
            NSArray *QAInfoArr = [resultJSON objectForKey:@"QAInfo"];
            for (NSDictionary *QAInfoDic in QAInfoArr) {
                QAInfo *QAInfo = [self tranformQAInfoDicToQAInfo:QAInfoDic];
                [_QAInfos addObject:QAInfo];
            }
        }else{
            NSDictionary *QAInfoDic = [resultJSON objectForKey:@"QAInfo"];
            _sendResultQAInfo = [[self tranformQAInfoDicToQAInfo:QAInfoDic] retain];
        }
        
    }
    
    return initResult;
}

#pragma mark -
#pragma mark private

- (QAInfo *)tranformQAInfoDicToQAInfo:(NSDictionary *)QAInfoDic
{
    QAInfo *info = [[[QAInfo alloc] init] autorelease];
    
    NSString *QAID = [QAInfoDic objectForKey:@"QAID"];
    if (QAID) {
        info.QAID = QAID;
    }
    
    NSString *QAParentID = [QAInfoDic objectForKey:@"QAParentID"];
    if (QAParentID) {
        info.QAParentID = QAParentID;
    }
    
    NSString *QAContent = [QAInfoDic objectForKey:@"QAContent"];
    if (QAContent) {
        info.QAContent = QAContent;
    }
    
    NSString *QAUser = [QAInfoDic objectForKey:@"QAUser"];
    if (QAUser) {
        info.QAUser = QAUser;
    }
    
    NSString *QADate = [QAInfoDic objectForKey:@"QADate"];
    if (QADate) {
        info.QADate = QADate;
    }
    
    return info;
}

- (void)resetQAInfoArr
{
    [_QAInfos release];
    _QAInfos = nil;
    
    _QAInfos = [[NSMutableArray alloc] initWithCapacity:10];
}


- (void)resetSendResultQAInfo
{
    [_sendResultQAInfo release];
    _sendResultQAInfo = nil;
    
    _sendResultQAInfo = [[QAInfo alloc] init];
}

- (void)dealloc
{
    self.getRequest         = nil;
    [_QAInfos release];
    
    self.sendQAInfo    = nil;
    self.sendRequest        = nil;
    [_sendResultQAInfo release];
    
    [super dealloc];
}


@end
