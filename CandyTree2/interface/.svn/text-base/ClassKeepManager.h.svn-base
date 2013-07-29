//
//  ClassKeepManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-27.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerErrorCode.h"
#import "JSONHttpRequest.h"

@interface ClassKeepInfo : NSObject

@property (nonatomic, retain) NSString *classID;
@property (nonatomic, retain) NSString *classKeepDate;
@property (nonatomic, assign) NSInteger keepCount;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, retain) NSString *classSummary;
@property (nonatomic, retain) NSString *imagePath;

@end


@interface ClassKeepManager : NSObject <JSONHttpRequestDelegate>


@property(nonatomic, readonly)NSMutableArray *classKeepInfos;

- (ServerErrorCode)addKeepClass:(NSString *)classID;
- (ServerErrorCode)delKeepClass:(NSString *)classID;
- (ServerErrorCode)getKeepClass;

@end
