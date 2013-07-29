//
//  ClassAuxiliaryInfoManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassAuxiliaryInfoManager.h"
#import "UserInfoManager.h"
#import "ServerErrorCode.h"

#define GET_CLASS_AUXILIARY_INFO_URL URL_MAIN@"GetClassInfoServlet"
@interface ClassAuxiliaryInfoManager ()

@property(nonatomic, retain)NSString *classID;
@property(nonatomic, retain)JSONHttpRequest *request;

@end


@implementation ClassAuxiliaryInfoManager

#pragma mark -
#pragma mark public

- (id)init
{
    if (self = [super init]) {
        self.request = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
    }
    
    return self;
}

- (ServerErrorCode)getInfoByClassID:(NSString *)classID
{
    self.classID = classID;
    return [self.request start];
}


#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    return GET_CLASS_AUXILIARY_INFO_URL;
}
- (NSString *)getPostJSON:(id)userData
{
    NSMutableDictionary *classAuxiliaryInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                                self.classID, @"ClassID",
                                                nil];
    
    
    
    NSLog(@"classAuxiliaryInfo = %@", [classAuxiliaryInfo JSONRepresentation]);
    
    return [classAuxiliaryInfo JSONRepresentation];
}
- (NSString *)getPostKey:(id)userData
{
    return @"GetClassInfoD";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    
    if (initResult == Server_Susccess) {
        NSDictionary *classInfo = [resultJSON objectForKey:@"ClassInfo"];
        if (classInfo) {
            _commentCount   = [[classInfo objectForKey:@"commentCount"] intValue];
            _keepCount      = [[classInfo objectForKey:@"keepCount"] intValue];
        }
    }
    
    return initResult;
}


#pragma mark -
#pragma mark private

- (void)dealloc
{
    self.classID = nil;
    self.request = nil;
    
    [super dealloc];
}

@end
