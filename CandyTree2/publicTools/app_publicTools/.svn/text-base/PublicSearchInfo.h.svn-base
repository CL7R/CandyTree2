//
//  PublicSearchInfo.h
//  dbc_passenger
//
//  Created by 孔 晨阳 on 12-11-21.
//  Copyright (c) 2012年 孔 晨阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PublicSearchInfoDelegate;

@interface PublicSearchInfo : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property(nonatomic,assign) int searchFlag;     //0可以隐藏搜索框1一直显示
@property(nonatomic,assign) id <PublicSearchInfoDelegate> delegate;
@property(nonatomic,retain) NSMutableArray *arrInfo;
@property(nonatomic,retain) UISearchBar *searchKey;
@property(nonatomic,retain) UITableView *tableInfo;

-(void)initData;
-(void)initView;
/*
 desc：设置table是否显示
 @param：hidden，YES隐藏NO显示
 return：
 */
- (void)setTableHidden:(BOOL)hidden;
/*
 desc：设置search是否显示
 @param：hidden，YES隐藏NO显示
 return：
 */
- (void)setSearchHidden:(BOOL)hidden;
/*
 desc：创建数据表格
 @param：noti，通知回调的参数
 return：
 */
-(void)createTableInfo:(NSNotification *)noti;

@end

@protocol PublicSearchInfoDelegate <NSObject>

/*
 desc：解析数据
 @param：
 return：NSDictionary
 */
-(NSDictionary *)analysisData:(id)object;
/*
 desc：选择选中的信息名称
 @param：
 return：
 */
-(void)selectInfoName:(id)object;

@end
