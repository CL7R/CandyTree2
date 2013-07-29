//
//  ServerErrorCode.m
//  CandyTree2
//
//  Created by fengfengxu on 13-5-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ServerErrorCode.h"

@implementation ServerErrorCodeMap

+ (ServerErrorCode)getServerErrorCode:(NSDictionary *)resultDictionay
{
    ServerErrorCode result = Server_ParamError;
    
    if (resultDictionay) {
        NSInteger resultFlag = [[resultDictionay objectForKey:@"resultFlag"] intValue];
        
        switch (resultFlag) {
            case 0:
                result = Server_Susccess;
                break;
            case -1:
                result = Server_ServerError;
                break;
            case -2:
                result = Server_UserNameOrPasswordWrong;
                break;
            case -3:
                result = Server_UserExist;
                break;
            case -4:
                result = Server_PaswordInvalid;
                break;
            case -5:
                result = Server_EmailNotExist;
                break;
            case -6:
                result = Server_OldPasswordWrong;
                break;
            case -7:
                result = Server_NewPasswordInvalid;
                break;
            case -8:
                result = Server_GetBackgroundFailed;
                break;
            case -9:
                result = Server_GetFrontCoverFailed;
                break;
            case -10:
                result = Server_GetClassInfoFailed;
                break;
            case -11:
                result = Server_GetCommentFailed;
                break;
            case -12:
                result = Server_SendCommentFailed;
                break;
            case -13:
                result = Server_keepClassFailed;
                break;
            case -14:
                result = Server_delKeepedClassFailed;
                break;
            case -15:
                result = Server_getkeepedClassFailed;
                break;
            case -16:
                result = Server_getFrontInfoFailed;
                break;
            case -17:
                result = Server_getBookShopFailed;
                break;
            case -18:
                result = Server_getBookClassInfoFailed;
                break;
            case -19:
                result = Server_BookShopSearchFailed;
                break;
            case -20:
                result = Server_getLoginDateFailed;
                break;
            case -21:
                result = Server_getGrowInfoFailed;
                break;
            case -22:
                result = Server_getQAFailed;
                break;
            case -23:
                result = Server_sendQuestFailed;
                break;
            default:
                break;
        }
    }
    
    return result;
    
    return result;
}

@end
