//
//  ClassSummeryInfoManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-28.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONHttpRequest.h"

@interface ClassSummeryInfo : NSObject

@property(nonatomic, retain) NSString *classID;
@property(nonatomic, retain) NSString *className;
@property(nonatomic, retain) NSString *classAutor;
@property(nonatomic, retain) NSString *classType;
@property(nonatomic, retain) NSString *classSummery;
@property(nonatomic, retain) NSString *imagePath;
@property(nonatomic, retain) NSString *classDownloadUrl;

@end



@interface ClassSummeryInfoManager : NSObject <JSONHttpRequestDelegate>


@property(nonatomic, readonly)ClassSummeryInfo *summery;

- (ServerErrorCode)getSummeryInfoByClassID:(NSString *)classID;

@end
