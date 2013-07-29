//
//  UserInfoManager.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequestDelegate.h"
#import "InterfacePublic.h"

typedef enum UserType{
    UserType_Nomarl = 0x01,       // 注册用户
    UserType_Payed  = 0x02,       // 付费用户
    UserType_School = 0x04        // 学校用户
}UserType;


@interface UserInfoManager : NSObject 

@property (nonatomic, readonly) NSString    *userName;
@property (nonatomic, readonly) NSString    *sessionID;
@property (nonatomic, readonly) NSUInteger  bgVersion;
@property (nonatomic, readonly) NSUInteger  classVersion;
@property (nonatomic, readonly) NSString    *userEmail;
@property (nonatomic, assign)   NSUInteger  useTime;
@property (nonatomic, readonly) UserType  userType;

+ (UserInfoManager *)shareInstance;
- (BOOL)isLogined;
- (ServerErrorCode)loginEmail:(NSString *)email AndPassword:(NSString *)password;
- (ServerErrorCode)regEmail:(NSString *)email AndPassword:(NSString *)password AndCode:(NSString *)code;
- (ServerErrorCode)logOut;
- (ServerErrorCode)ChangePasswordEmail:(NSString *)email
                        AndOldPassword:(NSString *)oldPassword
                        andNewPassword:(NSString *)newPassword;

- (ServerErrorCode)getPassword:(NSString *)email;

- (void)processInitInfo:(NSDictionary *)result;

@end
