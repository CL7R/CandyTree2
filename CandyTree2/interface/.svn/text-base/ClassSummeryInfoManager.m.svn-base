//
//  ClassSummeryInfoManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-28.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassSummeryInfoManager.h"
#import "UserInfoManager.h"
#import "ServerErrorCode.h"
#import "ImageDownloadQueue.h"

#define GET_CLASS_SUMMERY_INFO_URL URL_MAIN@"GetClassInfoServlet"

#define CLASS_SUMMARY_PATH           @"res/classSummary"
#define CLASS_SUMMARY_IMAGE_NAME_PREFIX    @"ck_"

@implementation ClassSummeryInfo

- (void)dealloc
{
    self.classID        = nil;
    self.className      = nil;
    self.classAutor     = nil;
    self.classType      = nil;
    self.classSummery   = nil;
    self.imagePath      = nil;
    self.classDownloadUrl = nil;
    
    [super dealloc];
}

@end



@interface ClassSummeryInfoManager ()

@property(nonatomic, retain)NSString *classID;
@property(nonatomic, retain)JSONHttpRequest *request;

@property(nonatomic, retain)ImageDownloadQueue *downloadQueue;

@end

@implementation ClassSummeryInfoManager


#pragma mark -
#pragma mark public

- (id)init
{
    if (self = [super init]) {
        self.request = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        
        self.downloadQueue = [[ImageDownloadQueue alloc] initWithDestPath:[self getClassSummaryImagePath]];
    }
    
    return self;
}

- (ServerErrorCode)getSummeryInfoByClassID:(NSString *)classID
{
    self.classID = classID;
    return [self.request start];
}


#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    return GET_CLASS_SUMMERY_INFO_URL;
}
- (NSString *)getPostJSON:(id)userData
{
    NSMutableDictionary *classSummeryInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                                self.classID, @"ClassID",
                                                nil];
    
    
    
    NSLog(@"classSummeryInfo = %@", [classSummeryInfo JSONRepresentation]);
    
    return [classSummeryInfo JSONRepresentation];
}
- (NSString *)getPostKey:(id)userData
{
    return @"getClassSummaryInfo";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    
    if (initResult == Server_Susccess) {
        NSDictionary *classSummeryInfoDic = [resultJSON objectForKey:@"ClassSummaryInfo"];
        if (classSummeryInfoDic) {
            _summery = [[self transformClasssummeryInfoDicToClassSummerInfo:classSummeryInfoDic] retain];
            
            NSString *imageUrl  = _summery.imagePath;
            NSString *imageName = [self getClassSummaryImageName:_summery.classID];
            [self.downloadQueue appendURL:[NSURL URLWithString:imageUrl]
                                 destName:imageName
                                   target:self
                                   select:@selector(oneImageDownloadFinish:)];
            
            
            _summery.imagePath = [[self getClassSummaryImagePath] stringByAppendingPathComponent:imageName];
            
            
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

- (ClassSummeryInfo *)transformClasssummeryInfoDicToClassSummerInfo:(NSDictionary *)classSummerInfoDic
{
    ClassSummeryInfo *classSummerInfo = [[[ClassSummeryInfo alloc] init] autorelease];
    
    classSummerInfo.classID     = [classSummerInfoDic objectForKey:@"classID"];
    classSummerInfo.className   = [classSummerInfoDic objectForKey:@"className"];
    classSummerInfo.classAutor  = [classSummerInfoDic objectForKey:@"classAutor"];
    classSummerInfo.classType   = [classSummerInfoDic objectForKey:@"classType"];
    classSummerInfo.imagePath   = [classSummerInfoDic objectForKey:@"classFrontCoverImageURl"];
    classSummerInfo.classSummery        = [classSummerInfoDic objectForKey:@"classSummary"];
    classSummerInfo.classDownloadUrl    = [classSummerInfoDic objectForKey:@"claasDownloadURL"];
    
    return classSummerInfo;
}

- (void)dealloc
{
    self.classID = nil;
    self.request = nil;
    
    self.downloadQueue = nil;
    
    [super dealloc];
}

- (NSString *)getClassSummaryImageName:(NSString *)classID
{
    return [NSString stringWithFormat:CLASS_SUMMARY_IMAGE_NAME_PREFIX"_%@", classID];
}

- (NSString *)getClassSummaryImagePath
{
    NSArray *paths      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath   =  paths.count > 0 ? [paths objectAtIndex:0]:nil;
    
    return [docPath stringByAppendingPathComponent:CLASS_SUMMARY_PATH];
}

@end
