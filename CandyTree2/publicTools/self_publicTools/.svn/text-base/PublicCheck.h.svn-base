//
//  PublicCheck.h
//  dbc
//  检查类，对字符串等做校验
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicCheck : NSObject
/*
 desc:邮箱校验
 @param:paramEmail：需要校验的邮箱
 return:BOOL，YES合格，NO不合格
 */
+(BOOL)validateEmail: (NSString *) paramEmail;
/*
 desc：字符串不为空校验
 @param:paramString：需要校验的字符串
 return:BOOL，YES为空，NO不为空
 */
+(BOOL)validateEmpty: (NSString *) paramString;
/*
 desc：字符串长度校验
 @param:paramString：需要校验的字符串
 @param:parmaLength：长度
 return:1符合，0小于，2大于
 */
+(int)validateLength: (NSString *) paramString
          parmaLength: (int) parmaLength;
/*
 desc：字符串数字校验
 @param:paramString：需要校验的字符串
 return:BOOL，YES为，NO不为
 */
+(BOOL)validateNumber: (NSString *) paramString;
/*
 desc：字符串为空则返回空字符，否则返回当前字符
 @param:paramString：需要校验的字符串
 return:NSString
 */
+(NSString *)emptyTransform: (NSString *) paramString;
/*
 desc：电话号码校验
 @param:paramString：需要校验的字符串
 return:BOOL，YES为，NO不为
 */
+(BOOL)validatePhoneNumber: (NSString *) paramString;
/*
 desc：验证码校验
 @param:paramString：需要校验的字符串
 @param:parmaLength：验证码长度
 return:BOOL，YES为，NO不为
 */
+(BOOL)validateVarifiNumber: (NSString *) paramString
                parmaLength: (int) parmaLength;
/*
 desc：验证密码
 @param:paramString：需要校验的字符串
 return:BOOL
 */
+(BOOL)validatePassword: (NSString *) paramString;
/*
 desc：密码是否一致
 @param:passwd：密码
 @param:passwdRd：重复输入密码
 return:BOOL，YES一致，NO不一致
 */
+(BOOL)validatePasswordSame: (NSString *) passwd
                   passwdRe: (NSString *) passwdRd;
@end
