//
//  ClassCommentManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-27.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONHttpRequest.h"
#import "ServerErrorCode.h"

@interface CommontInfo : NSObject

@property(nonatomic, retain) NSString *commentID;
@property(nonatomic, retain) NSString *commentParentID;
@property(nonatomic, retain) NSString *commentContent;
@property(nonatomic, retain) NSString *commentUser;
@property(nonatomic, retain) NSString *commentDate;

@end


@interface ClassCommentManager : NSObject <JSONHttpRequestDelegate>

@property(nonatomic, readonly)NSMutableArray  *commontInfoArray;
@property(nonatomic, readonly)CommontInfo     *sendResultCommentInfo;

- (ServerErrorCode)getCommentByClassID:(NSString *)classID from:(NSInteger)fromIndex to:(NSInteger)toIndex;
- (ServerErrorCode)sendCommentByClassID:(NSString *)classID comment:(CommontInfo *)commentInfo;

@end
