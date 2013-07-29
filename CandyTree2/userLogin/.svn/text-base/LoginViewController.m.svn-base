//
//  LoginViewController.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "UserInfoManager.h"
#import "InterfacePublic.h"
#import "PublicCheck.h"
#import "LoginView.h"
#import "MBHUDView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    [_loginView release];
    [super dealloc];
}
#pragma mark - init
-(void)initData{
    
}
-(void)initView{
    _loginView=[[LoginView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    self.view=_loginView;
    _loginView.texEmail.delegate=self;
    _loginView.texPasswd.delegate=self;    
    [_loginView.btnLogin addTarget:self action:@selector(actionLogin:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.btnForget addTarget:self action:@selector(actionForget:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.btnRegisterview addTarget:self action:@selector(actionRegisterview:) forControlEvents:UIControlEventTouchUpInside];
    //找回密码页面
    [_loginView initRetrieveView];
    _loginView.texReEmail.delegate=self;
    [_loginView.btnCancel addTarget:self action:@selector(actionCancel:) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.btnSend addTarget:self action:@selector(actionSend:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)testData{
    _okEmail=1;
    _okPasswd=1;
    _loginView.texEmail.text=@"123@123.com";
    _loginView.texPasswd.text=@"123";
}
-(BOOL)validateLogin{
    if (_okEmail==1&&_okPasswd==1) {
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
-(void)loginUser{
    UserInfoManager *user=[UserInfoManager shareInstance];
    int flag=[user loginEmail:_loginView.texEmail.text AndPassword:_loginView.texPasswd.text];
    dispatch_async(dispatch_get_main_queue(), ^{
        if(flag==Server_Susccess){
            //登陆成功
            MainViewController *main=[[[MainViewController alloc]init]autorelease];
            [self.navigationController pushViewController:main animated:YES];
        }
        else{
            [MBHUDView hudWithBody:NSLocalizedString(@"用户名或密码错误，请重试", nil) type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.0 show:YES];
        }
    });
}
#pragma mark - action
-(void)actionLogin:(id)sender{
    if ([self validateLogin]) {
        CLog(@"\n[actionLogin-ok]");
        [self startProgress:@selector(loginUser)];
    }
}
-(void)actionForget:(id)sender{
    [_loginView.viewRetrieve setHidden:NO];
}
-(void)actionRegisterview:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)actionCancel:(id)sender{
    [_loginView.viewRetrieve setHidden:YES];
}
-(void)actionSend:(id)sender{
    //[_loginView.viewRetrieve setHidden:YES];
    if (_okReEmail) {
        UserInfoManager *user=[UserInfoManager shareInstance];
        int flag=[user getPassword:_loginView.texReEmail.text];
        if (flag==Server_Susccess) {
            [MBHUDView hudWithBody:NSLocalizedString(@"邮件已发送，请您及时查收", nil) type:MBAlertViewHUDTypeCheckmark hidesAfter:1.0 show:YES];
        }
        else{
            [MBHUDView hudWithBody:NSLocalizedString(@"邮件发送失败请重试", nil) type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.0 show:YES];
        }
    }    
}
#pragma mark - textfield
-(void)textFieldDidEndEditing:(UITextField *)textField{
    CLog(@"\n[textFieldDidEndEditing]%@",textField);
    switch (textField.tag) {
        case TAG_EMAIL_LOGIN:{
            if(![PublicCheck validateEmail:textField.text]){
                _loginView.labEmail.hidden=NO;
                _okEmail=0;
            }
            else{
                _loginView.labEmail.hidden=YES;
                _okEmail=1;
            }
            break;
        }
        case TAG_PASSWD_LOGIN:{
            if(![PublicCheck validatePassword:textField.text]){
                _loginView.labPasswd.hidden=NO;
                _okPasswd=0;
            }
            else{
                _loginView.labPasswd.hidden=YES;
                _okPasswd=1;
            }
            break;
        }
        case TAG_REEMAIL_LOGIN:{
            if(![PublicCheck validateEmail:textField.text]){
                _loginView.labReEmail.hidden=NO;
                _okReEmail=0;
            }
            else{
                _loginView.labReEmail.hidden=YES;
                _okReEmail=1;
            }
            break;
        }
        default:
            break;
    }
}
@end
