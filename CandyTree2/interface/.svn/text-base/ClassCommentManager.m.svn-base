//
//  ClassCommentManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-27.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassCommentManager.h"
#import "UserInfoManager.h"

#define GET_CLASS_COMMENT_URL URL_MAIN@"ClassCommentInfoServlet"
#define SEND_CLASS_COMMENT_URL URL_MAIN@"SendCommentServlet"

typedef enum requestType {
    requestType_get = 1,
    requestType_send = 2
}requestType;



@implementation CommontInfo

- (void)dealloc
{
    self.commentID          = nil;
    self.commentContent     = nil;
    self.commentParentID    = nil;
    self.commentUser        = nil;
    self.commentDate        = nil;
    
    [super dealloc];
}

@end



@interface ClassCommentManager ()

@property(nonatomic, retain)NSString *getCommentClassID;
@property(nonatomic, retain)JSONHttpRequest *getRequest;
@property(nonatomic, assign)NSInteger fromIndex;
@property(nonatomic, assign)NSInteger toIndex;


@property(nonatomic, retain)NSString *sendCommentClassID;
@property(nonatomic, retain)CommontInfo *sendCommentInfo;
@property(nonatomic, retain)JSONHttpRequest *sendRequest;

@end

@implementation ClassCommentManager

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


- (ServerErrorCode)getCommentByClassID:(NSString *)classID from:(NSInteger)fromIndex to:(NSInteger)toIndex
{
    self.getCommentClassID    = classID;
    self.fromIndex  = fromIndex;
    self.toIndex    = toIndex;
    [self resetClassCommentInfoArr];
    
    return [self.getRequest start];
}


- (ServerErrorCode)sendCommentByClassID:(NSString *)classID comment:(CommontInfo *)commentInfo
{
    self.sendCommentClassID = classID;
    self.sendCommentInfo    = commentInfo;
    [self resetSendResultCommentInfo];
    
    return [self.sendRequest start];
}


#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    if ([userData intValue] == requestType_get) {
        return GET_CLASS_COMMENT_URL;
    }
    
    return SEND_CLASS_COMMENT_URL;
}
- (NSString *)getPostJSON:(id)userData
{
    
    if ([userData intValue] == requestType_get) {
        NSMutableDictionary *getCommentInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                    [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                                    self.getCommentClassID, @"ClassID",
                                                    [NSNumber numberWithInt:self.fromIndex], @"CommentStartIndex",
                                                    [NSNumber numberWithInt:self.toIndex], @"CommentEndIndex",
                                                    nil];
        
        
        
        NSLog(@"getCommentInfo = %@", [getCommentInfo JSONRepresentation]);
        
        return [getCommentInfo JSONRepresentation];
    }
    
    
    
    NSMutableDictionary *sendCommentInfoDic  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                            self.sendCommentClassID, @"ClassID",
                                            nil];
    
    if (self.sendCommentInfo.commentID) {
        [sendCommentInfoDic setObject:self.sendCommentInfo.commentID forKey:@"CommentID"];
    }
    
    if (self.sendCommentInfo.commentContent) {
        [sendCommentInfoDic setObject:self.sendCommentInfo.commentContent forKey:@"CommentContent"];
    }
    
    NSLog(@"sendCommentInfo = %@", [sendCommentInfoDic JSONRepresentation]);
    
    return [sendCommentInfoDic JSONRepresentation];
    
}
- (NSString *)getPostKey:(id)userData
{
    if ([userData intValue] == requestType_get) {
        return @"ClassCommentInfox";
    }
    
    return @"SendCommentInfo";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    
    if (initResult == Server_Susccess) {
        if ([userData intValue] == requestType_get) {
            NSArray *classCommmentInfoArr = [resultJSON objectForKey:@"ClassCommentInfo"];
            for (NSDictionary *commentInfoDic in classCommmentInfoArr) {
                CommontInfo *commentInfo = [self tranformCommentInfoDicToCommentInfo:commentInfoDic];
                [_commontInfoArray addObject:commentInfo];
            }
        }else{
            NSDictionary *classCommmentInfo = [resultJSON objectForKey:@"ClassCommentInfo"];
            _sendResultCommentInfo = [[self tranformCommentInfoDicToCommentInfo:classCommmentInfo] retain];
        }
        
    }
    
    return initResult;
}

#pragma mark -
#pragma mark private

- (CommontInfo *)tranformCommentInfoDicToCommentInfo:(NSDictionary *)commentInfoDic
{
    CommontInfo *commentInfo = [[[CommontInfo alloc] init] autorelease];
    
    NSString *commentID = [commentInfoDic objectForKey:@"commentID"];
    if (commentID) {
        commentInfo.commentID = commentID;
    }
    
    NSString *commentParentID = [commentInfoDic objectForKey:@"commentParentID"];
    if (commentParentID) {
        commentInfo.commentParentID = commentParentID;
    }
    
    NSString *commentContent = [commentInfoDic objectForKey:@"commentContent"];
    if (commentContent) {
        commentInfo.commentContent = commentContent;
    }
    
    NSString *commentDate = [commentInfoDic objectForKey:@"commentDate"];
    if (commentDate) {
        commentInfo.commentDate = commentDate;
    }
    
    NSString *commentUser = [commentInfoDic objectForKey:@"commentUser"];
    if (commentUser) {
        commentInfo.commentUser = commentUser;
    }
    
    return commentInfo;
}

- (void)resetClassCommentInfoArr
{
    [_commontInfoArray release];
    _commontInfoArray = nil;
    
    _commontInfoArray = [[NSMutableArray alloc] initWithCapacity:10];
}


- (void)resetSendResultCommentInfo
{
    [_sendResultCommentInfo release];
    _sendResultCommentInfo = nil;
    
    _sendResultCommentInfo = [[CommontInfo alloc] init];
}

- (void)dealloc
{
    self.getCommentClassID  = nil;
    self.getRequest         = nil;
    [_commontInfoArray release];
    
    self.sendCommentClassID = nil;
    self.sendCommentInfo    = nil;
    self.sendRequest        = nil;
    [_sendResultCommentInfo release];
    
    [super dealloc];
}



@end
