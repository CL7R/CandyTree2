//
//  RegisterView.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TAG_EMAIL           10
#define TAG_PASSWD          11
#define TAG_PASSWDRE        12
#define TAG_INVITE          13

@interface RegisterView : UIView

@property (nonatomic,retain) UITextField *texEmail;
@property (nonatomic,retain) UITextField *texPasswd;
@property (nonatomic,retain) UITextField *texPasswdRe;
@property (nonatomic,retain) UITextField *texInvite;
@property (nonatomic,retain) UISwitch *swiInvite;
@property (nonatomic,retain) UIButton *btnRegister;
@property (nonatomic,retain) UIButton *btnLoginview;
@property (nonatomic,retain) UIButton *btnExperience;
@property (nonatomic,retain) UILabel *labEmail;
@property (nonatomic,retain) UILabel *labPasswd;
@property (nonatomic,retain) UILabel *labPasswdRe;
@property (nonatomic,retain) UILabel *labInvite;

-(void)initView:(CGRect)frame;
@end
