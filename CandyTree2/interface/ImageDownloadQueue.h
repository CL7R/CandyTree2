//
//  ImageDownloadQueue.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-19.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloadQueue : NSObject

- (id)initWithDestPath:(NSString *)path;
- (void)appendURL:(NSURL *)imageUrl destName:(NSString *)destName target:(id)ob select:(SEL)select;
- (void)cancelAll;

- (void)test;
@end
