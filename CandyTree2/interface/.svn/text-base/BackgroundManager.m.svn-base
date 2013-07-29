//
//  BackgroundManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "BackgroundManager.h"
#import "ASIFormDataRequest.h"
#import "UserInfoManager.h"
#import "ImageDownloadQueue.h"
#import "ServerErrorCode.h"

#define GET_BG_URL URL_MAIN@"GetBGServlet"

#define BACKGROUND_PATH @"res/bg"
#define BACKGROUND_IMAGE_NAME_PREFIX @"bg_"

#define KEY_BACKGROUND_MANAGE_INFO @"KEY_BACKGROUND_MANAGE_INFO"
#define KEY_NEED_UPDATE @"KEY_NEED_UPDATE"
#define KEY_IMAGE_NAMES @"KEY_IMAGE_NAMES"

@interface BackgroundManager ()

@property (nonatomic, assign) BOOL needUpdate;
@property (nonatomic, retain) NSMutableArray *imageNames;
@property (nonatomic, retain) ImageDownloadQueue *downloadQueue;

@end


@implementation BackgroundManager

#pragma mark -
#pragma public

- (id)init
{
    if(self = [super init])
    {
        [self loadData];
        [self initDownloadQueue];
    }
    return self;
}

- (NSArray *)getAllImages
{
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:self.imageNames.count];
    NSString *bgImagePath  = [self getBackgroundImagePath];
    
    for (NSString *imageName in self.imageNames) {
        [images addObject:[bgImagePath stringByAppendingPathComponent:imageName]];
    }
    
    return images;
}

- (ServerErrorCode)updateBackgound
{
    NSURL *getBgUrl = [NSURL URLWithString:GET_BG_URL];
    
    ASIFormDataRequest *getBgRequest = [ASIFormDataRequest requestWithURL:getBgUrl];
    
    [getBgRequest setPostValue:[self getBgJson]
                          forKey:@"GetBGInfo"];
    
    [getBgRequest startSynchronous];
    
    NSError *error = [getBgRequest error];
    if (error) {
        NSLog(@"updateBackgound error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[getBgRequest responseString] JSONValue];
    return [self processGetBgResult:resultJSON];
 
}

#pragma mark -
#pragma private

- (void)initDownloadQueue
{
    if (self.downloadQueue) {
        [self.downloadQueue cancelAll];
    }
    ImageDownloadQueue *downloadQueue = [[ImageDownloadQueue alloc] initWithDestPath:BACKGROUND_PATH];
    self.downloadQueue = downloadQueue;
    [downloadQueue release];
}


- (NSString *)getBackgroundImagePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath =  paths.count > 0 ? [paths objectAtIndex:0]:nil;
    return [docPath stringByAppendingPathComponent:BACKGROUND_PATH];
}

- (void)dealloc
{
    self.imageNames = nil;
    
    [self.downloadQueue cancelAll];
    self.downloadQueue = nil;
    
    [super dealloc];
}

- (void)loadData
{
    NSDictionary *bgInfo = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_BACKGROUND_MANAGE_INFO];
    if (bgInfo) {
        self.needUpdate = [(NSNumber *)[bgInfo objectForKey:KEY_NEED_UPDATE] boolValue];
        self.imageNames = [NSMutableArray arrayWithArray:[bgInfo objectForKey:KEY_IMAGE_NAMES]];
        
    }else{
        self.needUpdate = YES;
        self.imageNames = [NSMutableArray array];
    }
}

- (void)saveData
{
    NSMutableDictionary *bgInfo = [NSMutableDictionary dictionaryWithCapacity:2];
    if (self.imageNames) {
        [bgInfo setObject:self.imageNames forKey:KEY_IMAGE_NAMES];
    }
    [bgInfo setObject:[NSNumber numberWithBool:self.needUpdate] forKey:KEY_NEED_UPDATE];

    [[NSUserDefaults standardUserDefaults] setObject:bgInfo forKey:KEY_BACKGROUND_MANAGE_INFO];

}


- (NSString *)getBgJson
{
    UserInfoManager *userInfo = [UserInfoManager shareInstance];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSMutableDictionary *getBGInfo  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            userInfo.sessionID, @"SessionID" ,
                                            appVersion, @"appVersion",
                                            nil];
    
    
    
    NSLog(@"getBGInfo = %@", [getBGInfo JSONRepresentation]);
    
    return [getBGInfo JSONRepresentation];
}

- (ServerErrorCode)processGetBgResult:(NSDictionary *)result
{
    ServerErrorCode getBgResult = [ServerErrorCodeMap getServerErrorCode:result];
    
    if (getBgResult == Server_Susccess) {
        NSDictionary *bgImageInfo = [result objectForKey:@"BGImageInfo"];
        if (bgImageInfo) {
            NSArray *imageUrls = [bgImageInfo objectForKey:@"imageURLArray"];
            [self.imageNames removeAllObjects];
            for (int i = 0; i < imageUrls.count; i++) {
                NSURL *bgImageUrl = [NSURL URLWithString:[imageUrls objectAtIndex:i]];
                NSString *bgImageName = [NSString stringWithFormat:BACKGROUND_IMAGE_NAME_PREFIX@"%d", i];
                [self.downloadQueue appendURL:bgImageUrl destName:bgImageName target:self select:@selector(bgOneImageDownloadFinish:)];
                [self.imageNames addObject:bgImageName];
            }
        
        }
    }
    
    return getBgResult;
}


- (void)bgOneImageDownloadFinish:(id)result
{
    // todo
}

@end
