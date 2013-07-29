//
//  FrontCoverManger.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfacePublic.h"

typedef enum ClassType{
    ClassType_School,       // 学校课程
    ClassType_Normal,       // 普通课程
    ClassType_Self          // 自绘课程
}ClassType;

@interface FrontCoverInfo : NSObject
@property (nonatomic, retain) NSString *classID;
@property (nonatomic, retain) NSString *className;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSString *classSummery;
@property (nonatomic, retain) NSString *classDownloadUrl;
@end

@interface FrontCoverManger : NSObject

- (NSArray *)getFrontCoverInfoByClassType:(ClassType)classType;
- (BOOL)addFrontCover:(FrontCoverInfo *)frontCover;
- (BOOL)delFrontCoverByClassID:(NSString *)classID;
- (ServerErrorCode)updateFrontCover:(ClassType)classType;
- (void)downlaodClassByClassID:(NSString *)classID ClassType:(ClassType)classType andTarget:(id)target;
@end
