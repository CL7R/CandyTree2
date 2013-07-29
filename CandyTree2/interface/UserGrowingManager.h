//
//  UserGrowingManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-29.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONHttpRequest.h"

@interface UserGrowingManager : NSObject <JSONHttpRequestDelegate>

@property(nonatomic, readonly) NSInteger level;

@end
