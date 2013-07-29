//
//  ImageDownloadQueue.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-19.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ImageDownloadQueue.h"
#import "ASIHTTPRequest.h"
#import <Foundation/NSOperation.h>
#import "InterfacePublic.h"

#define MAX_CONCURRENT_COUNT 4

@interface ImageDownloadQueue ()

@property(nonatomic, retain) NSOperationQueue *requestQueue;
@property(nonatomic, retain) NSString *destPath;
@end

@implementation ImageDownloadQueue

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

- (void)appendURL:(NSURL *)imageUrl destName:(NSString *)destName target:(id)ob select:(SEL)select
{
    [self.requestQueue addOperationWithBlock:^{
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:imageUrl];
        [request setDownloadDestinationPath:[self getImageFullPath:destName]];
        
        [request startSynchronous];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            BOOL ret = YES;
            NSError *error = [request error];
            if (error) {
                NSLog(@"downloadImage error = [%@]", error);
                ret = NO;
            }
            [ob performSelector:select withObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   imageUrl.absoluteString, @"url",
                                                   [NSNumber numberWithBool:ret], @"ret",
                                                   nil]];
            
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

- (void)test
{
    NSURL *url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/9E153058763.jpg"];
    [self appendURL:url  destName:@"1.jpg" target:self select:@selector(downloadfinish:)];
    
    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/AA153058106.jpg"];
    [self appendURL:url  destName:@"2.jpg" target:self select:@selector(downloadfinish:)];
    
    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/53153058780.jpg"];
    [self appendURL:url  destName:@"3.jpg" target:self select:@selector(downloadfinish:)];
    
    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/54153059156.jpg"];
    [self appendURL:url  destName:@"4.jpg" target:self select:@selector(downloadfinish:)];
    
    url = [NSURL URLWithString:@"http://wvw.mltuku.com/uploadfile/201112/2/85153059365.jpg"];
    [self appendURL:url  destName:@"5.jpg" target:self select:@selector(downloadfinish:)];
    
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

- (NSString *)getImageFullPath:(NSString *)name
{
    return [self.destPath stringByAppendingPathComponent:name];
}



@end
