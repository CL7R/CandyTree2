//
//  UserQAManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-29.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONHttpRequest.h"
#import "ServerErrorCode.h"

@interface QAInfo : NSObject

@property(nonatomic, retain) NSString *QAID;
@property(nonatomic, retain) NSString *QAParentID;
@property(nonatomic, retain) NSString *QAContent;
@property(nonatomic, retain) NSString *QAUser;
@property(nonatomic, retain) NSString *QADate;



@end


@interface UserQAManager : NSObject <JSONHttpRequestDelegate>

@property(nonatomic, readonly) NSMutableArray *QAInfos;
@property(nonatomic, readonly) QAInfo *sendResultQAInfo;


- (ServerErrorCode)sendQuestion:(QAInfo *)info;
- (ServerErrorCode)getQAInfoFrom:(NSInteger)fromIndex to:(NSInteger)toIndex;

@end
