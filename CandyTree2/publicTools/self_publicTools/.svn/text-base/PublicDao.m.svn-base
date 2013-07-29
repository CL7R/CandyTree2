//
//  PublicDao.m
//  dbc
//  数据持久层，各种保存数据的类
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicDao.h"

@implementation PublicDao
+(BOOL)getFileData:(NSString *)paramFile{
    @synchronized(self){
        BOOL flag=NO;
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                           NSUserDomainMask,
                                                           YES);
        NSString *documentsDirectory=[paths objectAtIndex:0];
        filePath =[documentsDirectory stringByAppendingPathComponent:paramFile];
        /*判断列表是否存在*/
        if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
            /*获取第一级字典*/
            dicFileData=[[[NSMutableDictionary alloc]
                          initWithContentsOfFile:filePath]autorelease];
            flag=YES;
        }
        else{
            dicFileData=[[[NSMutableDictionary alloc]init]autorelease];
        }
        return flag;
    }
}
/*保存文件*/
+(void)saveFile{
    @synchronized(self){
        [dicFileData writeToFile:filePath atomically:YES];
    }
}
@end
