//
//  FrontCoverManger.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "FrontCoverManger.h"
#import "ASIFormDataRequest.h"
#import "UserInfoManager.h"
#import "ClassDownloadQueue.h"
#import "ServerErrorCode.h"

@implementation FrontCoverInfo

- (void)dealloc
{
    self.classID    = nil;
    self.className  = nil;
    self.imageName  = nil;
    self.classSummery       = nil;
    self.classDownloadUrl   = nil;
    
    [super dealloc];
}

@end


#define GET_FRONT_COVER_URL URL_MAIN@"ClassPreViewServlet"

#define CLASS_FRONT_COVER_PATH          @"res/frontCover"
#define CLASS_FRONT_COVER_DATA_NAME     @"frontCoverData.plist"
#define CLASS_FRONT_COVER_IMAGE_NAME_PREFIX @"fc_"

#define KEY_FRONT_COVER_INFO @"KEY_FRONT_CONVER_INFO"
#define KEY_NEED_UPDATE @"KEY_NEED_UPDATE"
#define KEY_CLASS_TYPE_SHCOOL @"KEY_CLASS_TYPE_SHCOOL"
#define KEY_CLASS_TYPE_NORMAL @"KEY_CLASS_TYPE_NORMAL"
#define KEY_CLASS_TYPE_SELF @"KEY_CLASS_TYPE_SELF"

#define KEY_FRONT_COVER_CLASSID         @"KEY_FRONT_COVER_CLASSID"
#define KEY_FRONT_COVER_CLASS_NAME      @"KEY_FRONT_COVER_CLASS_NAME"
#define KEY_FRONT_COVER_IMAGE_NAME      @"KEY_FRONT_COVER_IMAGE_NAME"
#define KEY_FRONT_COVER_CLASS_SUMMERY   @"KEY_FRONT_COVER_CLASS_SUMMERY"
#define KEY_FRONT_COVER_DOWNLOAD_URL    @"KEY_FRONT_COVER_DOWNLOAD_URL"

#define DEFAULT_USER_EMAIL @"default"

@interface FrontCoverManger ()

@property (nonatomic, assign) BOOL needUpdate;
@property (nonatomic, retain) NSMutableDictionary *frontCoverInfos;
@property (nonatomic, retain) ClassDownloadQueue *downloadQueue;

@end
@implementation FrontCoverManger

#pragma mark -
#pragma mark public
- (id)init
{
    if (self = [super init]) {
        [self loadData];
    }
    
    return self;
}

- (NSArray *)getFrontCoverInfoByClassType:(ClassType)classType
{
    NSArray *classInfos = [self.frontCoverInfos objectForKey:[self mapClassTypeTokey:classType]];
    if (classInfos) {
        return [self transformDictToFrontCoverInfo:classInfos];
    }
    
    return nil;
}

- (BOOL)addFrontCover:(FrontCoverInfo *)frontCover
{
    if (!frontCover || !frontCover.classID) {
        return NO;
    }
    NSString *keyClassType = [self mapClassTypeTokey:ClassType_Normal];
    NSMutableArray  *classInfos = [NSMutableArray arrayWithArray:[self.frontCoverInfos objectForKey:keyClassType]];
    [classInfos addObject:[self transformFrontCoverInfoToDic:frontCover andIndex:classInfos.count]];
    [self.frontCoverInfos setObject:classInfos forKey:keyClassType];
    [self saveData];
    
    return YES;
}


- (BOOL)delFrontCoverByClassID:(NSString *)classID
{
    if (classID.length == 0) {
        return NO;
    }
    
    NSString *keyClassType = [self mapClassTypeTokey:ClassType_Normal];
    NSMutableArray  *classInfos = [NSMutableArray arrayWithArray:[self.frontCoverInfos objectForKey:keyClassType]];
    NSDictionary *frontCoverInfoDic = [self getFrontCoverInfoDicByClassID:classID classType:ClassType_Normal];
    [classInfos removeObject:frontCoverInfoDic];
    [self.frontCoverInfos setObject:classInfos forKey:keyClassType];
    [self saveData];
    
    return YES;
    
}


- (ServerErrorCode)updateFrontCover:(ClassType)classType
{
    NSURL *getFrontCoverUrl = [NSURL URLWithString:GET_FRONT_COVER_URL];
    
    ASIFormDataRequest *getfrontCoverRequest = [ASIFormDataRequest requestWithURL:getFrontCoverUrl];
    
    [getfrontCoverRequest setPostValue:[self getFrontCoverJson:classType]
                        forKey:@"GetClassInfoD"];
    
    [getfrontCoverRequest startSynchronous];
    
    NSError *error = [getfrontCoverRequest error];
    if (error) {
        NSLog(@"updateFrontCover error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[getfrontCoverRequest responseString] JSONValue];
    return [self processGetFrontCoverResult:resultJSON andClassType:classType];
}

- (void)downlaodClassByClassID:(NSString *)classID ClassType:(ClassType)classType andTarget:(id)target
{
    NSDictionary *frontCoverInfoDic = [self getFrontCoverInfoDicByClassID:classID classType:classType];
    NSString *frontCoverImageDownloadUrl = [frontCoverInfoDic objectForKey:KEY_FRONT_COVER_DOWNLOAD_URL];
    [self.downloadQueue appendURL:[NSURL URLWithString:frontCoverImageDownloadUrl]
                         destName:[frontCoverInfoDic objectForKey:KEY_FRONT_COVER_IMAGE_NAME]
                          target:target];
}


#pragma mark -
#pragma mark private

- (void)dealloc
{
    [self.downloadQueue cancelAll];
    self.downloadQueue  = nil;
    
    self.frontCoverInfos = nil;
    
    [super dealloc];
}

- (NSDictionary *)getFrontCoverInfoDicByClassID:(NSString *)classID classType:(ClassType)classType
{
    NSString *keyClassType = [self mapClassTypeTokey:classType];
    NSMutableArray  *classInfos = [NSMutableArray arrayWithArray:[self.frontCoverInfos objectForKey:keyClassType]];
    for (int i = 0; i < classInfos.count; i++) {
        NSDictionary * classInfo = [classInfos objectAtIndex:i];
        if ([classID isEqualToString:[classInfo objectForKey:KEY_FRONT_COVER_CLASSID]]) {
            return classInfo;
        }
    }
    
    return nil;
}

- (NSString *)getFrontCoverJson:(ClassType)classType
{
    UserInfoManager *userInfo = [UserInfoManager shareInstance];
    NSMutableDictionary *getBGInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       userInfo.sessionID, @"SessionID" ,
                                       [NSNumber numberWithInt:classType], @"ClassType",
                                       nil];
    
    
    
    NSLog(@"getFrontCoverJson = %@", [getBGInfo JSONRepresentation]);
    
    return [getBGInfo JSONRepresentation];
}

- (ServerErrorCode)processGetFrontCoverResult:(NSDictionary *)result andClassType:(ClassType)classType
{
    ServerErrorCode getBgResult = [ServerErrorCodeMap getServerErrorCode:result];
    
    if (getBgResult == Server_Susccess) {
        NSDictionary *frontCoverInfoDic = [result objectForKey:@"PreViewClassInfo"];
        if (frontCoverInfoDic) {
            NSArray *frontCoverInfoArrFromNet = [frontCoverInfoDic objectForKey:@"PreViewClassArray"];
            NSString *keyClassType = [self mapClassTypeTokey:classType];
            NSMutableArray *frontCoverInfoArrLocal = [NSMutableArray arrayWithCapacity:frontCoverInfoArrFromNet.count];
            [self.frontCoverInfos setObject:frontCoverInfoArrLocal forKey:keyClassType];
            
            for (int i = 0; i < frontCoverInfoArrFromNet.count; i++) {
                NSDictionary *frontCoverInfoDicNet      = [frontCoverInfoArrFromNet objectAtIndex:i];
                NSDictionary *frontCoverInfoDicLocal    = [self transformFrontCoverNetDicToLocalDic:frontCoverInfoDicNet andIndex:i];
                [frontCoverInfoArrLocal addObject:frontCoverInfoDicLocal];
            }
            [self.frontCoverInfos setObject:frontCoverInfoArrLocal forKey:keyClassType]; 
            
        }
    }
    
    return getBgResult;
}


- (NSString *)getFrontCoverImageNameByIndex:(NSInteger)index
{
    return [NSString stringWithFormat:CLASS_FRONT_COVER_IMAGE_NAME_PREFIX@"%d", index];
}


- (NSMutableDictionary *)transformFrontCoverNetDicToLocalDic:(NSDictionary *)frontCoverNetDic andIndex:(NSInteger)index
{
    
    NSMutableDictionary *dicInfo = [NSMutableDictionary dictionaryWithCapacity:frontCoverNetDic.count];
    
    NSString *classID = [frontCoverNetDic objectForKey:@"classID"];
    if (classID) {
        [dicInfo setObject:classID forKey:KEY_FRONT_COVER_CLASSID];
    }
    
    NSString *className = [frontCoverNetDic objectForKey:@"ClassName"];
    if (className) {
        [dicInfo setObject:className forKey:KEY_FRONT_COVER_CLASS_NAME];
    }
    
    NSString *classSummery = [frontCoverNetDic objectForKey:@"ClassSummary"];
    if (classSummery) {
        [dicInfo setObject:classSummery forKey:KEY_FRONT_COVER_CLASS_SUMMERY];
    }
    
    NSString *classDownloadUrl = [frontCoverNetDic objectForKey:@"ClassURL"];
    if (classDownloadUrl) {
        [dicInfo setObject:classDownloadUrl forKey:KEY_FRONT_COVER_DOWNLOAD_URL];
    }
    
    [dicInfo setObject:[self getFrontCoverImageNameByIndex:index] forKey:KEY_FRONT_COVER_IMAGE_NAME];
    
    return dicInfo;
}

- (NSMutableDictionary *)transformFrontCoverInfoToDic:(FrontCoverInfo *)frontCover andIndex:(NSInteger)index
{
    NSMutableDictionary *dicInfo = [NSMutableDictionary dictionaryWithCapacity:5];
    if (frontCover.classID) {
        [dicInfo setObject:frontCover.classID forKey:KEY_FRONT_COVER_CLASSID];
    }
    if (frontCover.className) {
        [dicInfo setObject:frontCover.className forKey:KEY_FRONT_COVER_CLASS_NAME];
    }
    if (frontCover.classSummery) {
        [dicInfo setObject:frontCover.classSummery forKey:KEY_FRONT_COVER_CLASS_SUMMERY];
    }
    if (frontCover.classDownloadUrl) {
        [dicInfo setObject:frontCover.classDownloadUrl forKey:KEY_FRONT_COVER_DOWNLOAD_URL];
    }
    
    [dicInfo setObject:[self getFrontCoverImageNameByIndex:index] forKey:KEY_FRONT_COVER_IMAGE_NAME];
    
    return dicInfo;
}

- (NSArray *)transformDictToFrontCoverInfo:(NSArray *)dictInfos
{
    NSMutableArray *frontCoverInfos = [NSMutableArray arrayWithCapacity:dictInfos.count];
    for (NSDictionary *dictInfo in dictInfos) {
        FrontCoverInfo *frontCoverInfo = [[FrontCoverInfo alloc] init];
        frontCoverInfo.classID      = [dictInfo objectForKey:KEY_FRONT_COVER_CLASSID];
        frontCoverInfo.className    = [dictInfo objectForKey:KEY_FRONT_COVER_CLASS_NAME];
        frontCoverInfo.imageName    = [[self getFrontCoverImagePath] stringByAppendingPathComponent:[dictInfo objectForKey:KEY_FRONT_COVER_IMAGE_NAME]];
        frontCoverInfo.classSummery = [dictInfo objectForKey:KEY_FRONT_COVER_CLASS_SUMMERY];
        frontCoverInfo.classDownloadUrl = [dictInfo objectForKey:KEY_FRONT_COVER_DOWNLOAD_URL];
        
        [frontCoverInfos addObject:frontCoverInfo];
        [frontCoverInfo release];
    }
    
    return frontCoverInfos;
    
}

- (NSString *)mapClassTypeTokey:(ClassType)classType
{
    switch (classType) {
        case ClassType_School:
            return KEY_CLASS_TYPE_SHCOOL;
        case ClassType_Normal:
            return KEY_CLASS_TYPE_NORMAL;
        default:
            return KEY_CLASS_TYPE_SELF;
    }
    
    return KEY_CLASS_TYPE_NORMAL;
}


- (NSString *)getFrontCoverPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath =  paths.count > 0 ? [paths objectAtIndex:0]:nil;
    return [docPath stringByAppendingPathComponent:CLASS_FRONT_COVER_PATH];
}

- (NSString *)getFrontCoverImagePath
{
    UserInfoManager *userInfo = [UserInfoManager shareInstance];
    NSString *userEmail = DEFAULT_USER_EMAIL;
    if (userInfo.isLogined) {
        userEmail = userInfo.userEmail;
    }

    return [[self getFrontCoverPath] stringByAppendingPathComponent:userEmail];
}

- (NSString *)getFrontCoverDataFullPath
{
    UserInfoManager *userInfo = [UserInfoManager shareInstance];
    NSString *userEmail = DEFAULT_USER_EMAIL;
    if (userInfo.isLogined) {
        userEmail = userInfo.userEmail;
    }
    
    NSString *userFrontCoverPath = [[self getFrontCoverPath] stringByAppendingPathComponent:userEmail];
    if (![[NSFileManager defaultManager] fileExistsAtPath:userFrontCoverPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:userFrontCoverPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    
    return [userFrontCoverPath stringByAppendingPathComponent:CLASS_FRONT_COVER_DATA_NAME];
}

- (void)loadData
{
    NSString *dataPath = [self getFrontCoverDataFullPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        NSMutableDictionary* data = [[NSMutableDictionary alloc] initWithContentsOfFile:dataPath];
        self.frontCoverInfos = [NSMutableDictionary dictionaryWithDictionary:[data objectForKey:KEY_FRONT_COVER_INFO]];
        self.needUpdate      = [(NSNumber *)[data objectForKey:KEY_NEED_UPDATE] boolValue];
    }else{
        self.frontCoverInfos = [NSMutableDictionary dictionaryWithCapacity:1];
        self.needUpdate = YES;
    }
}

- (void)saveData
{
    NSMutableDictionary* data = [NSMutableDictionary dictionaryWithCapacity:2];

    if (self.frontCoverInfos) {
        [data setObject:self.frontCoverInfos forKey:KEY_FRONT_COVER_INFO];
    }
    
    [data setObject:[NSNumber numberWithBool:self.needUpdate] forKey:KEY_NEED_UPDATE];
    [data writeToFile:[self getFrontCoverDataFullPath] atomically:YES];

}

- (void)initDownloadQueue
{
    if (!self.downloadQueue) {
        ClassDownloadQueue *downloadQueue = [[ClassDownloadQueue alloc] initWithDestPath:CLASS_FRONT_COVER_PATH];
        self.downloadQueue = downloadQueue;
        [downloadQueue release];
    }
}

@end
