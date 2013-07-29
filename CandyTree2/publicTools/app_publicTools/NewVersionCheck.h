//
//  NewVersionCheck.h
//  dbc2
//
//  Created by CL7RNEC on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewVersionCheck : UIViewController<UIAlertViewDelegate,UIAlertViewDelegate>

/*
 desc：同步检测新版本
 parame：
 return：
 */
-(void)checkVersionForSc;
/*
 desc：异步检测新版本
 parame：
 return：
 */
-(void)checkVersionForAsc;

@end
