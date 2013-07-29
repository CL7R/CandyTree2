//
//  RegisterViewController.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@class RegisterView;

@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,assign) int okEmail;
@property (nonatomic,assign) int okPasswd;
@property (nonatomic,assign) int okPasswdRe;
@property (nonatomic,assign) int okInvite;
@property (nonatomic,retain) RegisterView *registerView;
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
 desc：注册校验
 parame：
 return：BOOL
 */
-(BOOL)validateRegister;
/*
 desc：进度条
 parame：
 return：
 */
-(void)startProgress:(SEL)selector;
/*
 desc：用户注册
 parame：
 return：
 */
-(void)registerUser;
/*
 desc：邀请码开关
 parame：
 return：
 */
-(void)actionInviteSwitch:(id)sender;
/*
 desc：注册
 parame：
 return：
 */
-(void)actionRegister:(id)sender;
/*
 desc：切换到登陆
 parame：
 return：
 */
-(void)actionLoginview:(id)sender;
/*
 desc：立即体验
 parame：
 return：
 */
-(void)actionExperience:(id)sender;
@end
