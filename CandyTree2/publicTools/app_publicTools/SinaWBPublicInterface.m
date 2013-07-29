//
//  SinaWBPublicInterface.m
//  SinaWeiBoSDK
//
//  Created by pengfei wang on 12-3-8.
//  Copyright (c) 2012年 asiainfo-linkage. All rights reserved.
//

#import "SinaWBPublicInterface.h"

//微博
#define SINA_APP_KEY      @"2348858407"
#define SINA_APP_SECRET   @"83eac65d7ebc8b6d0e79053056a6b0bf"
#define REDIRECT_URL      @"http://www.sina.com"

@interface SinaWBPublicInterface ()

@property (strong,nonatomic) WBEngine* weibo;
@property (strong,nonatomic) NSString *strToken;

@end

@implementation SinaWBPublicInterface
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [_weibo release];
    [super dealloc];
}
#pragma mark init
+(SinaWBPublicInterface *)getInstance{
    static SinaWBPublicInterface *sina;
    if(sina==nil){
        sina=[[SinaWBPublicInterface alloc]init];
    }
    return sina;
}
-(void)initWeiBo{
    _weibo = [[WBEngine alloc] initWithAppKey:SINA_APP_KEY appSecret:SINA_APP_SECRET];
    [_weibo setRootViewController:self];
    [_weibo setDelegate:self];
    [_weibo setRedirectURI:REDIRECT_URL];
    [_weibo setIsUserExclusive:NO];
}

#pragma mark other
- (void)weiboLogin{
    [_weibo logIn];
}
- (void)weiboLogout{
    [_weibo logOut];
}

-(void)weiboSend:(NSString *)infos
           image:(UIImage *)image{
    [_weibo sendWeiBoWithText:infos image:image];
}

#pragma mark - WBEngineDelegate Methods
#pragma mark Authorize
- (void)engineAlreadyLoggedIn:(WBEngine *)engine
{
    CLog(@"\n[engineAlreadyLoggedIn]");
    if ([engine isUserExclusive])
    {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
                                                           message:@"请先登出！" 
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
}

- (void)engineDidLogIn:(WBEngine *)engine
{
    CLog(@"\n[engineDidLogIn]%@", engine.accessToken);
    _strToken=engine.accessToken;
}

- (void)engine:(WBEngine *)engine didFailToLogInWithError:(NSError *)error
{
    CLog(@"[didFailToLogInWithError]%@", error);
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
													   message:@"登录失败！"
													  delegate:nil
											 cancelButtonTitle:@"确定"
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)engineDidLogOut:(WBEngine *)engine
{
    CLog(@"[engineDidLogOut]");
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
													   message:@"登出成功！" 
													  delegate:self
											 cancelButtonTitle:@"确定" 
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)engineNotAuthorized:(WBEngine *)engine
{
    CLog(@"[engineNotAuthorized]");
}

- (void)engineAuthorizeExpired:(WBEngine *)engine
{
    CLog(@"[engineAuthorizeExpired]");
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
													   message:@"请重新登录！" 
													  delegate:nil
											 cancelButtonTitle:@"确定" 
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)engine:(WBEngine *)engine requestDidSucceedWithResult:(id)result
{
    CLog(@"\n[requestDidSucceedWithResult]");
    NSDictionary *dic=(NSDictionary *)result;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"新浪微博"
                                                     message:[NSString stringWithFormat:@"发送成功！" ]
                                                    delegate:nil cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)engine:(WBEngine *)engine requestDidFailWithError:(NSError *)error
{
    CLog(@"\n[requestDidFailWithError]%@", error);
}
@end
