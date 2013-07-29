//
//  ClassKeepManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-27.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassKeepManager.h"
#import "UserInfoManager.h"
#import "ImageDownloadQueue.h"

#define ADD_KEEP_URL URL_MAIN@"AddClassKeepServlet"
#define DEL_KEEP_URL URL_MAIN@"DelClassKeepServlet"
#define GET_KEEP_URL URL_MAIN@"GetClassKeepServlet"

#define CLASS_KEEP_IMAGE_PATH           @"res/classKeep"
#define CLASS_KEEP_IMAGE_NAME_PREFIX    @"ck_"


typedef enum requestType {
    requestType_add = 1,
    requestType_del = 2,
    requestType_get = 3
}requestType;

@implementation ClassKeepInfo

- (void)dealloc
{
    self.classID        = nil;
    self.classSummary   = nil;
    self.classKeepDate  = nil;
    self.imagePath = nil;
    
    [super dealloc];
}

@end


@interface ClassKeepManager ()

@property(nonatomic, retain)NSString *addClassID;
@property(nonatomic, retain)JSONHttpRequest *addRequest;

@property(nonatomic, retain)NSString *delClassID;
@property(nonatomic, retain)JSONHttpRequest *delRequest;

@property(nonatomic, retain)JSONHttpRequest *getRequest;


@property(nonatomic, retain)ImageDownloadQueue *downloadQueue;

@end


@implementation ClassKeepManager

#pragma mark -
#pragma mark public

- (id)init
{
    if (self = [super init]) {
        self.addRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.addRequest.userData = [NSNumber numberWithInt:requestType_add];
        
        self.delRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.delRequest.userData = [NSNumber numberWithInt:requestType_del];
        
        self.getRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.getRequest.userData = [NSNumber numberWithInt:requestType_get];
        
        self.downloadQueue = [[ImageDownloadQueue alloc] initWithDestPath:[self getClassKeepImagePath]];
        
    }
    return self;
}

- (ServerErrorCode)addKeepClass:(NSString *)classID
{
    self.addClassID = classID;
    
    return [self.addRequest start];
}

- (ServerErrorCode)delKeepClass:(NSString *)classID
{
    self.delClassID = classID;
    
    return [self.delRequest start];
}

- (ServerErrorCode)getKeepClass
{
    [self retsetClassKeepInfos];
    
    return [self.getRequest start];
}

#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_add) {
        return ADD_KEEP_URL;
    }else if(type == requestType_del){
        return  DEL_KEEP_URL;
    }
    
    return GET_KEEP_URL;
}
- (NSString *)getPostJSON:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_add) {
        NSMutableDictionary *addKeepJSON  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                    [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                                    self.addClassID, @"ClassID",
                                                    nil];
        
        
        
        NSLog(@"addKeepJSON = %@", [addKeepJSON JSONRepresentation]);
        
        return [addKeepJSON JSONRepresentation];
    }else if(type == requestType_del){
        NSMutableDictionary *delKeepJSON  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                             [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                             self.delClassID, @"ClassID",
                                             nil];
        
        
        
        NSLog(@"delKeepJSON = %@", [delKeepJSON JSONRepresentation]);
        
        return [delKeepJSON JSONRepresentation];

    }

    NSMutableDictionary *getKeeyJSON  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                         [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                         nil];



    NSLog(@"getKeeyJSON = %@", [getKeeyJSON JSONRepresentation]);

    return [getKeeyJSON JSONRepresentation];


}
- (NSString *)getPostKey:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_add) {
        return @"AddClassKeepInfo";
    }else if(type == requestType_del){
        return  @"DelClassKeepInfo";
    }
    
    return @"GetClassKeepServlet";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    requestType type = [userData intValue];
    
    if (initResult == Server_Susccess) {
        if (type == requestType_get) {
            NSArray *classKeepInfoArr = [resultJSON objectForKey:@"ClassKeepInfo"];
            for (int i =0; i < classKeepInfoArr.count; i++) {
                NSDictionary *classKeepInfoDic = [classKeepInfoArr objectAtIndex:i];
                ClassKeepInfo *classKeepInfo = [self transformClassKeepInfoDicToClassKeepInfo:classKeepInfoDic];
                [_classKeepInfos addObject:classKeepInfo];
                
                NSString *imageUrl  = classKeepInfo.imagePath;
                NSString *imageName = [self getClassKeepImageName:i];
                [self.downloadQueue appendURL:[NSURL URLWithString:imageUrl]
                                     destName:imageName
                                       target:self
                                       select:@selector(oneImageDownloadFinish:)];
                
                
                classKeepInfo.imagePath = [[self getClassKeepImagePath] stringByAppendingPathComponent:imageName];
         
            }
            
            
        }
    }
    
    return initResult;
}


#pragma mark -
#pragma mark private

-(void)oneImageDownloadFinish:(id)ret
{
    // todo
    
}


- (ClassKeepInfo *)transformClassKeepInfoDicToClassKeepInfo:(NSDictionary *)classKeepInfoDic
{
    ClassKeepInfo * classKeepInfo = [[[ClassKeepInfo alloc] init] autorelease];
    
    classKeepInfo.classID       = [classKeepInfoDic objectForKey:@"classID"];
    classKeepInfo.classKeepDate = [classKeepInfoDic objectForKey:@"classKeepDate"];
    classKeepInfo.keepCount     = [[classKeepInfoDic objectForKey:@"classKeepCount"] intValue];
    classKeepInfo.classSummary  = [classKeepInfoDic objectForKey:@"classSummary"];
    classKeepInfo.imagePath = [classKeepInfoDic objectForKey:@"classFrontCoverImageURl"];
    return classKeepInfo;
}


- (void)retsetClassKeepInfos
{
    [_classKeepInfos release];
    _classKeepInfos = nil;
    
    _classKeepInfos = [[NSMutableArray alloc] initWithCapacity:10];
    
    [self.downloadQueue cancelAll];
}


- (void)dealloc
{
    self.addClassID = nil;
    self.addRequest = nil;
    
    self.delRequest = nil;
    self.delClassID = nil;
    
    self.getRequest = nil;
    
    
    [_classKeepInfos release];
    
    [super dealloc];
}

- (NSString *)getClassKeepImageName:(NSInteger)index
{
    return [NSString stringWithFormat:CLASS_KEEP_IMAGE_NAME_PREFIX"_%d", index];
}

- (NSString *)getClassKeepImagePath
{
    NSArray *paths      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath   =  paths.count > 0 ? [paths objectAtIndex:0]:nil;
    
    return [docPath stringByAppendingPathComponent:CLASS_KEEP_IMAGE_PATH];;
}

@end
