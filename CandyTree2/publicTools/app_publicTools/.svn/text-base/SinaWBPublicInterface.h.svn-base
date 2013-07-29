//
//  SinaWBPublicInterface.h
//  SinaWeiBoSDK
//
//  Created by pengfei wang on 12-3-8.
//  Copyright (c) 2012年 asiainfo-linkage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBEngine.h"
#import "WBSendView.h"
#import "WBLogInAlertView.h"

@interface SinaWBPublicInterface : UIViewController<WBEngineDelegate, UIAlertViewDelegate,WBLogInAlertViewDelegate>

/*
 desc：获取单例
 parame：
 return：
 */
+(SinaWBPublicInterface *)getInstance;
/*
 desc：授权验证
 parame：
 return：
 */
-(void)initWeiBo;
/*
 desc：登陆
 parame：
 return：
 */
- (void)weiboLogin;
/*
 desc：解除绑定
 parame：
 return：
 */
- (void)weiboLogout;
/*
 desc：发送微博
 parame：
 return：
 */
-(void)weiboSend:(NSString *)infos
           image:(UIImage *)image;
@end
