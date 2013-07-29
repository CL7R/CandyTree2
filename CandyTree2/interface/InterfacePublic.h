//
//  InterfacePublic.h
//  CandyTree2
//
//  Created by fengfengxu on 13-5-19.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#ifndef CandyTree2_InterfacePublic_h
#define CandyTree2_InterfacePublic_h

typedef enum ServerErrorCode{
    Server_Susccess     = 0,        // 成功
    Server_ParamError   = 1,        // 参数错误
    Server_NetError     = 2,        // 网络错误
    Server_ServerError  = 3,        // 服务器错误
    Server_UserNameOrPasswordWrong  = 4,        // 用户名或密码不正确
    Server_UserExist                = 5,        // 用户已存在
    Server_PaswordInvalid           = 6,        // 无效密码
    Server_EmailNotExist            = 7,        // 找回密码邮箱不存在
    Server_OldPasswordWrong         = 8,        // 修改密码失败 旧密码不对
    Server_NewPasswordInvalid       = 9,        // 修改密码失败 新密码无效
    Server_GetBackgroundFailed      = 10,       // 获取封面数组失败
    Server_GetFrontCoverFailed      = 11,       // 获取封面数组失败
    Server_GetClassInfoFailed       = 12,       // 获取课程信息失败
    Server_GetCommentFailed         = 13,       // 获取评论失败
    Server_SendCommentFailed        = 14,       // 发送评论失败
    Server_keepClassFailed          = 15,       // 收藏课程失败
    Server_delKeepedClassFailed     = 16,       // 删除收藏失败
    Server_getkeepedClassFailed     = 17,       // 获取收藏失败
    Server_getFrontInfoFailed       = 18,       // 获取课程封面失败
    Server_getBookShopFailed        = 19,       // 获取书城信息失败
    Server_getBookClassInfoFailed   = 20,       // 获取商城分类信息失败
    Server_BookShopSearchFailed     = 21,       // 搜索失败
    Server_getLoginDateFailed       = 22,       // 获取登录日历失败
    Server_getGrowInfoFailed        = 23,       // 获取成长记录失败
    Server_getQAFailed              = 24,       // 获取问答失败
    Server_sendQuestFailed          = 25,       // 发送问题失败
    Server_UnkownError
}ServerErrorCode;


#endif
