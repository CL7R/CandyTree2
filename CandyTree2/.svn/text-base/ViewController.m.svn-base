//
//  ViewController.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-3-26.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"
#import "UserInfoManager.h"
#import "AppInitManager.h"

@interface ViewController ()
-(void)initData;
-(void)initView;
/*
 desc：校验session
 parame：
 return：BOOL
 */
-(BOOL)validateSession;
@end

NSString *sessionID;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - init
-(void)initData{
    //初始化
}
-(void)initView{
    /*
     未登录用户进入注册页面
     登陆用户直接进入主页
     通过本地sessionID判断是否登录
     */
    CLog(@"\n[initView]");
    if([self validateSession]){
        MainViewController *main=[[[MainViewController alloc]init]autorelease];
        [self.navigationController pushViewController:main animated:NO];
    }
    else{
        RegisterViewController *registerCon=[[[RegisterViewController alloc]init]autorelease];
        [self.navigationController pushViewController:registerCon animated:NO];
    }
}
-(BOOL)validateSession{
    UserInfoManager *user=[UserInfoManager shareInstance];
    return [user isLogined];
}
@end
