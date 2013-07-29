//
//  LoginView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView:frame];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc{
    [_texEmail release];
    [_texPasswd release];
    [_btnForget release];
    [_btnRegisterview release];
    [_btnLogin release];
    [_labEmail release];
    [_labPasswd release];
    [_viewRetrieve release];
    [_texReEmail release];
    [_btnCancel release];
    [_btnSend release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    self.backgroundColor=[UIColor whiteColor];
    //邮箱
    _texEmail=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    _texEmail.tag=TAG_EMAIL_LOGIN;
    _texEmail.borderStyle = UITextBorderStyleRoundedRect;
    _texEmail.returnKeyType=UIReturnKeyDone;
    _texEmail.keyboardType=UIKeyboardTypeEmailAddress;
    _texEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:_texEmail];
    CGRect rect=_texEmail.frame;
    _labEmail=[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-60, 0, 60, 50)];
    _labEmail.textColor=[UIColor redColor];
    _labEmail.backgroundColor=[UIColor clearColor];
    _labEmail.font=[UIFont systemFontOfSize:12];
    _labEmail.hidden=YES;
    _labEmail.text=NSLocalizedString(@"格式不符", nil);
    [_texEmail addSubview:_labEmail];
    //密码
    _texPasswd=[[UITextField alloc]initWithFrame:CGRectMake(100, 170, 200, 50)];
    _texPasswd.tag=TAG_PASSWD_LOGIN;
    _texPasswd.borderStyle = UITextBorderStyleRoundedRect;
    _texPasswd.returnKeyType=UIReturnKeyDone;
    _texPasswd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:_texPasswd];
    rect=_texPasswd.frame;
    _labPasswd=[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-60, 0, 60, 50)];
    _labPasswd.textColor=[UIColor redColor];
    _labPasswd.backgroundColor=[UIColor clearColor];
    _labPasswd.font=[UIFont systemFontOfSize:12];
    _labPasswd.hidden=YES;
    _labPasswd.text=NSLocalizedString(@"格式不符", nil);
    [_texPasswd addSubview:_labPasswd];
    //登陆
    _btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnLogin retain];
    [_btnLogin setFrame:CGRectMake(100, 380, 100, 50)];
    [_btnLogin setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnLogin setTitle:NSLocalizedString(@"登录", nil) forState:UIControlStateNormal];
    [self addSubview:_btnLogin];
    //忘记密码
    _btnForget=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnForget retain];
    [_btnForget setFrame:CGRectMake(250, 380, 100, 50)];
    [_btnForget setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnForget setTitle:NSLocalizedString(@"忘记密码", nil) forState:UIControlStateNormal];
    [self addSubview:_btnForget];
    //切换注册
    _btnRegisterview=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnRegisterview retain];
    [_btnRegisterview setFrame:CGRectMake(100, 450, 100, 50)];
    [_btnRegisterview setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnRegisterview setTitle:NSLocalizedString(@"立即注册", nil) forState:UIControlStateNormal];
    [self addSubview:_btnRegisterview];
}
-(void)initRetrieveView{
    _viewRetrieve=[[UIView alloc]initWithFrame:CGRectMake(400, 200, 300, 100)];
    [_viewRetrieve setHidden:YES];
    [_viewRetrieve setBackgroundColor:[UIColor blackColor]];
    [self addSubview:_viewRetrieve];
    _texReEmail=[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 200, 50)];
    _texReEmail.tag=TAG_REEMAIL_LOGIN;
    _texReEmail.borderStyle = UITextBorderStyleRoundedRect;
    _texReEmail.returnKeyType=UIReturnKeyDone;
    _texReEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_viewRetrieve addSubview:_texReEmail];
    CGRect rect=_texReEmail.frame;
    _labReEmail=[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-60, 0, 60, 50)];
    _labReEmail.textColor=[UIColor redColor];
    _labReEmail.backgroundColor=[UIColor clearColor];
    _labReEmail.font=[UIFont systemFontOfSize:12];
    _labReEmail.hidden=YES;
    _labReEmail.text=NSLocalizedString(@"格式不符", nil);
    [_texReEmail addSubview:_labReEmail];
    _btnSend=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnSend retain];
    [_btnSend setFrame:CGRectMake(100, 70, 50, 30)];
    [_btnSend setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnSend setTitle:NSLocalizedString(@"发送", nil) forState:UIControlStateNormal];
    [_viewRetrieve addSubview:_btnSend];
    _btnCancel=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnCancel retain];
    [_btnCancel setFrame:CGRectMake(10, 70, 50, 30)];
    [_btnCancel setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnCancel setTitle:NSLocalizedString(@"取消", nil) forState:UIControlStateNormal];
    [_viewRetrieve addSubview:_btnCancel];
}
@end
