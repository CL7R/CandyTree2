//
//  RegisterViewController.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "InterfacePublic.h"
#import "UserInfoManager.h"
#import "RegisterView.h"
#import "PublicCheck.h"
#import "MBHUDView.h"
#import "DownlaodProgressView.h"
#import "ClassDownloadQueue.h"
#import <UIKit/UIKit.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initData];
    [self initView];
    [self testData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [_registerView release];
    [super dealloc];
}
#pragma mark - init
-(void)initData{
    
}
-(void)initView{    
    _registerView=[[RegisterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    self.view=_registerView;
    _registerView.texEmail.delegate=self;
    _registerView.texPasswd.delegate=self;
    _registerView.texPasswdRe.delegate=self;
    _registerView.texInvite.delegate=self;
    [_registerView.swiInvite addTarget:self action:@selector(actionInviteSwitch:) forControlEvents:UIControlEventValueChanged];
    [_registerView.btnRegister addTarget:self action:@selector(actionRegister:) forControlEvents:UIControlEventTouchUpInside];
    [_registerView.btnLoginview addTarget:self action:@selector(actionLoginview:) forControlEvents:UIControlEventTouchUpInside];
    [_registerView.btnExperience addTarget:self action:@selector(actionExperience:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - other
-(void)testData{
    _okEmail=1;
    _okPasswd=1;
    _okPasswdRe=1;
    _okInvite=1;
    _registerView.texEmail.text=@"123@123.com";
    _registerView.texPasswd.text=@"123";
    _registerView.texPasswdRe.text=@"123";
    _registerView.texInvite.text=@"123";
}
-(BOOL)validateRegister{
    if (_okEmail==1&&_okPasswd==1&&_okPasswdRe==1&&_okInvite==1) {
        return YES;
    }
    else{
        return NO;
    }
}
-(void)startProgress:(SEL)selector{
    _mbPro = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:_mbPro];
	_mbPro.dimBackground = YES;
    _mbPro.delegate = (id)self;
    [_mbPro showWhileExecuting:selector onTarget:self withObject:nil animated:YES];
}
-(void)registerUser{
    UserInfoManager *user=[UserInfoManager shareInstance];
    int flag=[user regEmail:_registerView.texEmail.text AndPassword:_registerView.texPasswd.text AndCode:_registerView.texInvite.text];
    dispatch_async(dispatch_get_main_queue(), ^{
        if(flag==Server_Susccess){
            //注册成功
            [MBHUDView hudWithBody:NSLocalizedString(@"注册成功", nil) type:MBAlertViewHUDTypeCheckmark hidesAfter:1.0 show:YES];
        }
        else{
            [MBHUDView hudWithBody:NSLocalizedString(@"注册失败，请重试", nil) type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.0 show:YES];
            
        }
    });
}
#pragma mark - action
-(void)actionInviteSwitch:(id)sender{
    UISwitch *swi=(UISwitch *)sender;
    CLog(@"\n[actionInviteSwitch]%d",swi.isOn);
    if (!swi.isOn) {
        _registerView.texInvite.hidden=YES;
    }
    else{
        _registerView.texInvite.hidden=NO;
    }
}
-(void)actionRegister:(id)sender{
    [self.view endEditing:YES];
    if ([self validateRegister]) {
        CLog(@"\n[actionRegister-ok]");
        [self startProgress:@selector(registerUser)];
    }
}
-(void)actionLoginview:(id)sender{
    CLog(@"\n[actionLoginview]");
    LoginViewController *login=[[[LoginViewController alloc]init]autorelease];
    [self.navigationController pushViewController:login animated:NO];
}
-(void)actionExperience:(id)sender{
    MainViewController *main=[[[MainViewController alloc]init]autorelease];
    [self.navigationController pushViewController:main animated:YES];
}
#pragma mark - textfield
//格式验证
-(void)textFieldDidEndEditing:(UITextField *)textField{
    CLog(@"\n[textFieldDidEndEditing]%@",textField);
    switch (textField.tag) {
        case TAG_EMAIL:{
            if(![PublicCheck validateEmail:textField.text]){
                _registerView.labEmail.hidden=NO;
                _okEmail=0;
            }
            else{
                _registerView.labEmail.hidden=YES;
                _okEmail=1;
            }
            break;
        }
        case TAG_PASSWD:{
            if(![PublicCheck validatePassword:textField.text]){
                _registerView.labPasswd.hidden=NO;
                _okPasswd=0;
            }
            else{
                _registerView.labPasswd.hidden=YES;
                _okPasswd=1;
            }
            break;
        }
        case TAG_PASSWDRE:{
            if(![PublicCheck validatePasswordSame:_registerView.texPasswd.text passwdRe:textField.text]){
                _registerView.labPasswdRe.hidden=NO;
                _okPasswdRe=0;
            }
            else{
                _registerView.labPasswdRe.hidden=YES;
                _okPasswdRe=1;
            }
            break;
        }
        case TAG_INVITE:{
            if([PublicCheck validateEmpty:textField.text]){
                _registerView.labInvite.hidden=NO;
                _okInvite=0;
            }
            else{
                _registerView.labInvite.hidden=YES;
                _okInvite=1;
            }
            break;
        }
        default:
            break;
    }
}
#pragma mark - userinfoDelegate

@end
