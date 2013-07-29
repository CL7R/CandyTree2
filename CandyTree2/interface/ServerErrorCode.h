//
//  ServerErrorCode.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfacePublic.h"

@interface ServerErrorCodeMap : NSObject
+ (ServerErrorCode)getServerErrorCode:(NSDictionary *)resultDictionay;
@end
