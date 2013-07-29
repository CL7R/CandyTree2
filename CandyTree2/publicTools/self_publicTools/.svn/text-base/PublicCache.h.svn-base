//
//  PublicCache.h
//  dbc
//  缓存类，可以存放缓存信息
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicCache : NSObject
@property(nonatomic,retain) NSString *strPath;
/*
 desc：获取单例
 @parame
 return：PublicCache
 */
+(PublicCache *)getInstance;
/*
 desc：清空缓存
 @parame
 return：
 */
-(void)clearCache;
/*
 desc：初始化缓存路径
 @parame
 return：
 */
-(void) initCacheDirectory;
/*
 desc：得到图片路径，并放入缓存
 @parame:paramUrl:图片地址
 return：UIImage
 */
-(UIImage *) getImageUrlSaveCache: (NSString *) paramUrl;
/*
 desc：从缓存获取图片
 @parame:paramUrl:图片地址
 return：UIImage
 */
-(UIImage *) getImageCache:(NSString *) paramUrl;
@end
