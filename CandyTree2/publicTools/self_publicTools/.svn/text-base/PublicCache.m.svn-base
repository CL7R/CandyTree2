//
//  PublicCache.m
//  dbc
//  缓存类
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicCache.h"

@implementation PublicCache
@synthesize strPath;

-(void)dealloc{
    [strPath release];
    [super dealloc];
}
+(PublicCache *)getInstance{
    static PublicCache *cac;
    if(cac==nil){
        cac=[[PublicCache alloc]init];
    }
    return cac;
}
-(void) clearCache{
    NSFileManager* fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator* en = [fm enumeratorAtPath: self.strPath];    
    NSError* err = nil;
    BOOL res;
    NSString* file = nil;
    while(file = [en nextObject]){
        res = [fm removeItemAtPath:[self.strPath stringByAppendingPathComponent:file] error:&err];
        if (!res && err){
            //错误信息
        }
    }
}
-(void) initCacheDirectory{
    self.strPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    //[self.strPath retain];
}
-(UIImage *) getImageUrlSaveCache: (NSString *) paramUrl{
    UIImage *returnImage;
    NSString *imageCachePath = [paramUrl stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    imageCachePath = [self.strPath stringByAppendingPathComponent: imageCachePath];
    // 从网络上获取图片
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: paramUrl]];
    [data writeToFile: imageCachePath atomically: YES];
    returnImage = [UIImage imageWithData: data];
    return returnImage;
}
-(UIImage *) getImageCache:(NSString *) paramUrl{
    UIImage *returnImage;
    NSString *imageCachePath = [paramUrl stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    imageCachePath = [self.strPath stringByAppendingPathComponent: imageCachePath];
    if([[NSFileManager defaultManager] fileExistsAtPath: imageCachePath]){
        returnImage= [UIImage imageWithContentsOfFile: imageCachePath];
    }
    else{
        returnImage=[self getImageUrlSaveCache:paramUrl];
    }
    return returnImage;
}
@end
