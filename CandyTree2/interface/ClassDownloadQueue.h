//
//  ClassDownloadQueue.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-22.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassDownloadQueue : NSObject

- (id)initWithDestPath:(NSString *)path;
- (void)appendURL:(NSURL *)imageUrl destName:(NSString *)destName target:(id)ob;
- (void)cancelAll;

- (void)test:(id)target;

@end
