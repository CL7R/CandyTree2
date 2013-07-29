//
//  BookStoreManager.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-29.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "BookStoreManager.h"
#import "UserInfoManager.h"
#import "ImageDownloadQueue.h"
#import "ServerErrorCode.h"

#define SEARCH_URL          URL_MAIN@"SearchServlet"
#define GET_BOOK_TYPE_URL   URL_MAIN@"GetBookTypeServlet"
#define GET_BOOK_STORE_URL  URL_MAIN@"GetBookStoreInfoServlet"

#define BOOK_STORE_IMAGE_PATH           @"res/bookStore"
#define BOOK_STORE_IMAGE_NAME_PREFIX    @"bk_"


typedef enum requestType {
    requestType_search  = 1,
    requestType_getType = 2,
    requestType_getBook = 3
}requestType;

@implementation BookInfo

- (void)dealloc
{
    self.classID        = nil;
    self.classSummary   = nil;
    self.classKeepDate  = nil;
    self.imagePath = nil;
    
    [super dealloc];
}

@end

@interface BookStoreManager ()

@property(nonatomic, retain)JSONHttpRequest *getBookRequest;

@property(nonatomic, retain)JSONHttpRequest *getTypeRequest;

@property(nonatomic, retain)JSONHttpRequest *searchRequest;


@property(nonatomic, retain)ImageDownloadQueue *getBookDownloadQueue;
@property(nonatomic, retain)ImageDownloadQueue *searchDownloadQueue;

@property(nonatomic, retain)NSString *searchType;
@property(nonatomic, retain)NSString *keyword;

@end



@implementation BookStoreManager

#pragma mark -
#pragma mark public

- (id)init
{
    if (self = [super init]) {
        self.getBookRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.getBookRequest.userData = [NSNumber numberWithInt:requestType_getBook];
        
        self.getTypeRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.getTypeRequest.userData = [NSNumber numberWithInt:requestType_getType];
        
        self.searchRequest = [[[JSONHttpRequest alloc] initWithDelegate:self] autorelease];
        self.searchRequest.userData = [NSNumber numberWithInt:requestType_search];
        
        self.getBookDownloadQueue = [[ImageDownloadQueue alloc] initWithDestPath:[self getBookStoreImagePath]];
        self.searchDownloadQueue  = [[ImageDownloadQueue alloc] initWithDestPath:[self getBookStoreImagePath]];
        
    }
    return self;
}


- (ServerErrorCode)getBookStoreInfo
{
    [self resetBookInfos];
    
    return [self.getBookRequest start];
}

- (ServerErrorCode)getSearchType
{
    [self resetSearchTypeInfo];
    
    return [self.getTypeRequest start];
}

- (ServerErrorCode)searchBook:(NSString *)classType andKeyword:(NSString *)keyword
{
    self.searchType = classType;
    self.keyword    = keyword;
    
    [self resetSearchBookInfo];
    
    return [self.searchRequest start];
}



#pragma mark -
#pragma mark JSONHttpRequestDelegate

- (NSString *)getUrl:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_getBook) {
        return GET_BOOK_STORE_URL;
    }else if(type == requestType_getType){
        return  GET_BOOK_TYPE_URL;
    }
    
    return SEARCH_URL;
}
- (NSString *)getPostJSON:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_getBook) {
        NSMutableDictionary *getBookJSON  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                             [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                             nil];
        
        
        
        NSLog(@"getBookJSON = %@", [getBookJSON JSONRepresentation]);
        
        return [getBookJSON JSONRepresentation];
    }else if(type == requestType_getType){
        NSMutableDictionary *getTypeJSON  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                             [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                             nil];
        
        
        
        NSLog(@"delKeepJSON = %@", [getTypeJSON JSONRepresentation]);
        
        return [getTypeJSON JSONRepresentation];
        
    }
    
    NSMutableDictionary *searchJSON  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                         [UserInfoManager shareInstance].sessionID, @"SessionID" ,
                                         nil];
    
    
    
   
    if (self.keyword) {
        [searchJSON setObject:self.keyword forKey:@"SearchKeyWord"];
    }
    
    if (self.searchType) {
        [searchJSON setObject:self.searchType forKey:@"ClassType"];
    }
    
    NSLog(@"searchJSON = %@", [searchJSON JSONRepresentation]);
    
    return [searchJSON JSONRepresentation];
    
    
}
- (NSString *)getPostKey:(id)userData
{
    requestType type = [userData intValue];
    if (type == requestType_getBook) {
        return @"SessionID";
    }else if(type == requestType_getType){
        return  @"SessionID";
    }
    
    return @"SearchInfo";
}

- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON
{
    ServerErrorCode initResult = [ServerErrorCodeMap getServerErrorCode:resultJSON];
    requestType type = [userData intValue];
    
    if (initResult == Server_Susccess) {
        if (type == requestType_getBook) {
            NSDictionary *bookStoreInfo = [resultJSON objectForKey:@"classStroeInfo"];
            NSArray *bookStoreTop3      = [bookStoreInfo objectForKey:@"top3ClassStoreInfoArray"];
            NSArray *bookStoreNormal    = [bookStoreInfo objectForKey:@"classStoreInfoArray"];
            
            _bookInfosTop3   = [[self processBookInfoFromArray:bookStoreTop3
                                                  finishSelect:@selector(oneBookImageDownloadFinish:)] retain];
            _bookInfosNormal = [[self processBookInfoFromArray:bookStoreNormal
                                                  finishSelect:@selector(oneBookImageDownloadFinish:)] retain];
            
        }else if(type == requestType_search){
            NSDictionary *bookStoreInfo = [resultJSON objectForKey:@"classStoreInfo"];
            NSArray *searchResultbook     = [bookStoreInfo objectForKey:@"ClassStoreInfoArray"];
            
            _searchResultBookInfos = [[self processBookInfoFromArray:searchResultbook
                                                        finishSelect:@selector(oneSearchBookImageDownloadFinish:)] retain];
        }else{
            NSDictionary *bookStoreInfo = [resultJSON objectForKey:@"classTypeInfo"];
            NSArray *searchTypes     = [bookStoreInfo objectForKey:@"classTypeArray"];
        
            _searchTypeArr = [searchTypes retain];
            
        }
    }
    
    return initResult;
}

#pragma mark -
#pragma mark private

-(void)oneBookImageDownloadFinish:(id)ret
{
    // todo
    
}

-(void)oneSearchBookImageDownloadFinish:(id)ret
{
    // todo
    
}

- (NSMutableArray *)processBookInfoFromArray:(NSArray *)bookInfoArr finishSelect:(SEL)select
{
    NSMutableArray * bookInfos = [[NSMutableArray alloc] initWithCapacity:bookInfoArr.count];
    
    for (int i =0; i < bookInfoArr.count; i++) {
        NSDictionary *booInfoDic = [bookInfoArr objectAtIndex:i];
        BookInfo *bookInfo = [self transformBookInfoDicToBookInfo:booInfoDic];
        [bookInfos addObject:bookInfo];

        NSString *imageUrl  = bookInfo.imagePath;
        NSString *imageName = [self getImageNameByClassID:bookInfo.classID];
        [self.getBookDownloadQueue appendURL:[NSURL URLWithString:imageUrl]
                                    destName:imageName
                                      target:self
                                      select:select];


        bookInfo.imagePath = [[self getBookStoreImagePath] stringByAppendingPathComponent:imageName];
        
    }
    
    return bookInfos;
 
}


- (BookInfo *)transformBookInfoDicToBookInfo:(NSDictionary *)bookInfoDic
{
    BookInfo * bookInfo = [[[BookInfo alloc] init] autorelease];
    
    bookInfo.classID        = [bookInfoDic objectForKey:@"classID"];
    bookInfo.classKeepDate  = [bookInfoDic objectForKey:@"classDate"];
    bookInfo.keepCount      = [[bookInfoDic objectForKey:@"classKeepCount"] intValue];
    bookInfo.commentCount   = [[bookInfoDic objectForKey:@"classCommentCount"] intValue];
    bookInfo.classSummary   = [bookInfoDic objectForKey:@"classSummary"];
    bookInfo.imagePath      = [bookInfoDic objectForKey:@"classFrontCoverImageURl"];
    
    return bookInfo;
}


- (void)resetBookInfos
{
    [_bookInfosTop3 release];
    _bookInfosTop3 = nil;
    _bookInfosTop3 = [[NSMutableArray alloc] initWithCapacity:10];
    
    [_bookInfosNormal release];
    _bookInfosNormal = nil;
    _bookInfosNormal = [[NSMutableArray alloc] initWithCapacity:10];
    
    
    [self.getBookDownloadQueue cancelAll];
}

- (void)resetSearchTypeInfo
{
    [_searchTypeArr release];
    _searchTypeArr = nil;
    _searchTypeArr = [[NSMutableArray alloc] initWithCapacity:10];
    
    
}

- (void)resetSearchBookInfo
{
    [_searchResultBookInfos release];
    _searchResultBookInfos = nil;
    _searchResultBookInfos = [[NSMutableArray alloc] initWithCapacity:10];
    
    
    [self.searchDownloadQueue cancelAll];
}

- (void)dealloc
{
    self.getBookRequest = nil;
    
    self.getTypeRequest = nil;
    
    self.searchRequest = nil;
    
    self.getBookDownloadQueue   = nil;
    self.searchDownloadQueue    = nil;
    
    [_bookInfosNormal release];
    [_bookInfosTop3 release];
    [_searchDownloadQueue release];
    [_searchTypeArr release];
    
    self.keyword        = nil;
    self.searchType     = nil;
    
    
    [super dealloc];
}

- (NSString *)getImageNameByClassID:(NSString *)classID
{
    return [NSString stringWithFormat:BOOK_STORE_IMAGE_NAME_PREFIX"_%@", classID];
}


- (NSString *)getBookStoreImagePath
{
    NSArray *paths      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath   =  paths.count > 0 ? [paths objectAtIndex:0]:nil;
    
    return [docPath stringByAppendingPathComponent:BOOK_STORE_IMAGE_PATH];;
}
@end
