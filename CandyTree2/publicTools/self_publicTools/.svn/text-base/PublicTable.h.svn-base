//
//  PublicTable.h
//  dbc
//  表格类，关于table的常用方法，由于继承自PullRefreshTableViewController开源类（下来刷新），所以要引入该类方可
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"
@class MBProgressHUD;
@interface PublicTable : PullRefreshTableViewController

@property(nonatomic,retain) NSMutableArray *arrData;    //数据
@property(nonatomic,retain) MBProgressHUD *mbProgress;  //进度条
/*
 desc：开启进度条
 @param:paramInfo：进度条文字描述
 return：
 */
-(void)startProg:(NSString *)paramInfo;
/*
 desc：关闭进度条
 @param：
 return：
 */
-(void)endProg;
/*
 desc：追加表格行，用于分页显示
 @param:paramData：追加的数据
 return：
 */
-(void)appendTableWith:(NSMutableArray *)paramData;
/*
 desc：下拉刷新获取数据
 @param：
 return：
 */
- (void)pullData;
/*
 desc：获取数据
 @param：
 return：
 */
-(void)getDataInfo;
@end
