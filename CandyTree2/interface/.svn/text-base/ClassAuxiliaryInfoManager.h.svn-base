//
//  ClassAuxiliaryInfoManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONHttpRequest.h"

@interface ClassAuxiliaryInfoManager : NSObject <JSONHttpRequestDelegate>

@property(nonatomic, readonly) NSInteger commentCount;
@property(nonatomic, readonly) NSInteger keepCount;


- (ServerErrorCode)getInfoByClassID:(NSString *)classID;

@end
