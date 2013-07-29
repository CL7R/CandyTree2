//
//  JSONHttpRequest.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfacePublic.h"

@class JSONHttpRequest;

@protocol JSONHttpRequestDelegate <NSObject>

@required
- (NSString *)getUrl:(id)userData;
- (NSString *)getPostJSON:(id)userData;
- (NSString *)getPostKey:(id)userData;
- (ServerErrorCode)process:(id)userData resultJSON:(NSDictionary*)resultJSON;

@end


@interface JSONHttpRequest : NSObject

@property(nonatomic, retain)id userData;

- (id)initWithDelegate:(id<JSONHttpRequestDelegate>)delegate;

- (ServerErrorCode)start;

@end
