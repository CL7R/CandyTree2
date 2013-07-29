//
//  LoginViewController.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@class LoginView;

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,assign) int okEmail;
@property (nonatomic,assign) int okPasswd;
@property (nonatomic,assign) int okReEmail;
@property (strong,nonatomic) LoginView *loginView;
@property (nonatomic,retain) MBProgressHUD *mbPro;

-(void)initData;
-(void)initView;
/*
 desc：测试数据
 parame：
 return：
 */
-(void)testData;
/*
 desc：登陆校验
 parame：
 return：BOOL
 */
-(BOOL)validateLogin;
/*
 desc：进度条
 parame：
 return：
 */
-(void)startProgress:(SEL)selector;
/*
 desc：用户登录
 parame：
 return：
 */
-(void)loginUser;
/*
 desc：登陆
 parame：
 return：
 */
-(void)actionLogin:(id)sender;
/*
 desc：忘记密码
 parame：
 return：
 */
-(void)actionForget:(id)sender;
/*
 desc：切换到注册
 parame：
 return：
 */
-(void)actionRegisterview:(id)sender;
/*
 desc：取消找回密码
 parame：
 return：
 */
-(void)actionCancel:(id)sender;
/*
 desc：发送邮箱
 parame：
 return：
 */
-(void)actionSend:(id)sender;
@end
