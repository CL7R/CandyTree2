//
//  ClassDownloadQueue.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-22.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassDownloadQueue.h"
#import "ASIFormDataRequest.h"
#import "ZipArchive.h"

#define MAX_CONCURRENT_COUNT 6

@interface ClassDownloadQueue ()

@property(nonatomic, retain) NSOperationQueue *requestQueue;
@property(nonatomic, retain) NSString *destPath;
@end

@implementation ClassDownloadQueue

#pragma mark -
#pragma mark public

- (id)initWithDestPath:(NSString *)path
{
    self = [super init];
    if (self) {
        _requestQueue = [[NSOperationQueue alloc] init];
        _requestQueue.maxConcurrentOperationCount = MAX_CONCURRENT_COUNT;
        
        [self initDestPath:path];
    }
    return self;
}

- (void)appendURL:(NSURL *)imageUrl destName:(NSString *)destName target:(id)ob
{
    [self.requestQueue addOperationWithBlock:^{
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:imageUrl];
        NSString *destFullPath = [self getDownloadFileFullPath:destName];
        [request setDownloadDestinationPath:destFullPath];
        [request setDownloadProgressDelegate:ob];
        [request startSynchronous];
        
        BOOL ret = YES;
        NSError *error = [request error];
        if (error) {
            NSLog(@"downloadImage error = [%@]", error);
            ret = NO;
        }else{
            ret = [self unZipDownloadFile:destFullPath];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([ob respondsToSelector:@selector(downloadfinish:)]){
                [ob downloadfinish:[NSNumber numberWithBool:ret]];
            }
        });
        
    }];
}


- (void)cancelAll
{
    [self.requestQueue cancelAllOperations];
}

#pragma mark -
#pragma mark private

- (void)downloadfinish:(id)result
{
    NSLog(@"dwonload result = [%@]", result);
}

- (void)setProgress:(float)newProgress
{
    NSLog(@"progress = [%f]", newProgress);
}

- (void)test:(id)target
{
    NSURL *url = [NSURL URLWithString:@"https://github-central.s3.amazonaws.com/mac/812e9f1a-81f9-11e2-842a-d627744bf6bd.zip"];
    [self appendURL:url  destName:@"123.zip" target:target];
    
//    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/AA153058106.jpg"];
//    [self appendURL:url  destName:@"2.jpg" target:self select:@selector(downloadfinish:)];
//    
//    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/53153058780.jpg"];
//    [self appendURL:url  destName:@"3.jpg" target:self select:@selector(downloadfinish:)];
//    
//    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/54153059156.jpg"];
//    [self appendURL:url  destName:@"4.jpg" target:self select:@selector(downloadfinish:)];
//    
//    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/85153059365.jpg"];
//    [self appendURL:url  destName:@"5.jpg" target:self select:@selector(downloadfinish:)];
    
}

- (void)dealloc
{
    [self.requestQueue cancelAllOperations];
    self.requestQueue = nil;
    
    self.destPath = nil;
    
    [super dealloc];
}

- (void)initDestPath:(NSString*)path
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    self.destPath = path;
}

- (NSString *)getDownloadFileFullPath:(NSString *)name
{
    return [self.destPath stringByAppendingPathComponent:name];
}

- (BOOL)unZipDownloadFile:(NSString *)zipFile;
{
    NSString *unZipPath = [zipFile substringToIndex:zipFile.length - @".zip".length];
    BOOL ret = NO;
    ZipArchive* zip = [[ZipArchive alloc] init];
    if ([zip UnzipOpenFile:zipFile]) {
        ret = [zip UnzipFileTo:unZipPath overWrite:YES];
        [zip UnzipCloseFile];
    }
    
    return ret;
}


@end
