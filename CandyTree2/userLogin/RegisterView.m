//
//  RegisterView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

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
    [_texPasswdRe release];
    [_texInvite release];
    [_swiInvite release];
    [_btnRegister release];
    [_btnLoginview release];
    [_btnExperience release];
    [_labEmail release];
    [_labPasswd release];
    [_labPasswdRe release];
    [_labInvite release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    self.backgroundColor=[UIColor whiteColor];
    //邮箱
    _texEmail=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    _texEmail.tag=TAG_EMAIL;
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
    _texPasswd.tag=TAG_PASSWD;
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
    //重输密码
    _texPasswdRe=[[UITextField alloc]initWithFrame:CGRectMake(100, 240, 200, 50)];
    _texPasswdRe.tag=TAG_PASSWDRE;
    _texPasswdRe.borderStyle = UITextBorderStyleRoundedRect;
    _texPasswdRe.returnKeyType=UIReturnKeyDone;
    _texPasswdRe.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:_texPasswdRe];
    rect=_texPasswdRe.frame;
    _labPasswdRe=[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-60, 0, 60, 50)];
    _labPasswdRe.textColor=[UIColor redColor];
    _labPasswdRe.backgroundColor=[UIColor clearColor];
    _labPasswdRe.font=[UIFont systemFontOfSize:12];
    _labPasswdRe.hidden=YES;
    _labPasswdRe.text=NSLocalizedString(@"密码不一致", nil);
    [_texPasswdRe addSubview:_labPasswdRe];
    //邀请码
    _texInvite=[[UITextField alloc]initWithFrame:CGRectMake(100, 310, 200, 50)];
    _texInvite.tag=TAG_INVITE;
    _texInvite.borderStyle = UITextBorderStyleRoundedRect;
    _texInvite.returnKeyType=UIReturnKeyDone;
    _texInvite.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:_texInvite];
    rect=_texInvite.frame;
    _labInvite=[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-60, 0, 60, 50)];
    _labInvite.textColor=[UIColor redColor];
    _labInvite.backgroundColor=[UIColor clearColor];
    _labInvite.font=[UIFont systemFontOfSize:12];
    _labInvite.hidden=YES;
    _labInvite.text=NSLocalizedString(@"格式不符", nil);    
    [_texInvite addSubview:_labInvite];
    //邀请码开关
    _swiInvite=[[UISwitch alloc]initWithFrame:CGRectMake(320, 310, 80, 50)];
    [_swiInvite setOn:YES];
    [self addSubview:_swiInvite];
    //注册
    _btnRegister=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnRegister retain];
    [_btnRegister setFrame:CGRectMake(100, 380, 100, 50)];
    [_btnRegister setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnRegister setTitle:NSLocalizedString(@"注册", nil) forState:UIControlStateNormal];
    [self addSubview:_btnRegister];
    
    //切换到登陆页面
    _btnLoginview=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnLoginview retain];
    [_btnLoginview setFrame:CGRectMake(100, 450, 100, 50)];
    [_btnLoginview setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnLoginview setTitle:NSLocalizedString(@"立即登录", nil) forState:UIControlStateNormal];
    [self addSubview:_btnLoginview];
    //立即体验
    _btnExperience=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnExperience retain];
    [_btnExperience setFrame:CGRectMake(100,520, 100, 50)];
    [_btnExperience setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_btnExperience setTitle:NSLocalizedString(@"立即体验", nil) forState:UIControlStateNormal];
    [self addSubview:_btnExperience];
}
@end
