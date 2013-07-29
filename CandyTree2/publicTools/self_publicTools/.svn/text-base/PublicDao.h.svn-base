//
//  PublicDao.h
//  dbc
//  数据持久类，保存数据用到的类
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//默认文件名称
#define dataFile_main   @"dataFile.plist"
//文件路径
NSString *filePath;
//保存对象
NSMutableDictionary *dicFileData;
@interface PublicDao : NSObject
/*
 desc：获取数据
 @param:paramFile：文件名称
 fileName：文件名称
 return：BOOL
 */
+(BOOL)getFileData:(NSString *)paramFile;
/*
 desc：保存文件
 parame：
 return：
 */
+(void)saveFile;
@end
