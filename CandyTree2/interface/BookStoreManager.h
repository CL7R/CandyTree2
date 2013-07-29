//
//  BookStoreManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-29.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONHttpRequest.h"

@interface BookInfo : NSObject

@property (nonatomic, retain) NSString *classID;
@property (nonatomic, retain) NSString *classKeepDate;
@property (nonatomic, assign) NSInteger keepCount;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, retain) NSString *classSummary;
@property (nonatomic, retain) NSString *imagePath;

@end


@interface BookStoreManager : NSObject <JSONHttpRequestDelegate>


@property (nonatomic, readonly) NSArray *bookInfosTop3;
@property (nonatomic, readonly) NSArray *bookInfosNormal;
@property (nonatomic, readonly) NSArray *searchResultBookInfos;
@property (nonatomic, readonly) NSArray *searchTypeArr;



- (ServerErrorCode)getBookStoreInfo;
- (ServerErrorCode)getSearchType;
- (ServerErrorCode)searchBook:(NSString *)classType andKeyword:(NSString *)keyword;

@end
