//
//  JSONHttpRequest.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "JSONHttpRequest.h"
#import "ASIFormDataRequest.h"

@interface JSONHttpRequest ()

@property(nonatomic, assign) id<JSONHttpRequestDelegate> delegate;

@end


@implementation JSONHttpRequest

- (id)initWithDelegate:(id<JSONHttpRequestDelegate>)delegate
{
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}

- (ServerErrorCode)start
{
    if (self.delegate == nil) {
        return Server_ParamError;
    }
    
    NSURL *postUrl = [NSURL URLWithString:[self.delegate getUrl:self.userData]];
    
    ASIFormDataRequest *postRequest = [ASIFormDataRequest requestWithURL:postUrl];
    
    [postRequest setPostValue:[self.delegate getPostJSON:self.userData]
                       forKey:[self.delegate getPostKey:self.userData]];
    
    [postRequest startSynchronous];
    
    NSError *error = [postRequest error];
    if (error) {
        NSLog(@"error = [%@]", error);
        return Server_NetError;
    }
    
    NSDictionary *resultJSON = [[postRequest responseString] JSONValue];
    return [self.delegate process:self.userData resultJSON:resultJSON];
}

@end
