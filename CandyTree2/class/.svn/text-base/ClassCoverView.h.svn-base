//
//  ClassCoverView.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoverCellView;

@protocol ClassCoverViewDelegate;

@interface ClassCoverView : UIView

@property (nonatomic,assign) id<ClassCoverViewDelegate> delegate;
@property (strong,nonatomic) UIScrollView *scrolCover;

/*
 desc：封面cell视图
 parame：cellPosition：cell位置
 parame：cellIndex：cell索引
 parame：cellSection：cell第几页
 parame：classID：课程ID
 parame：imageName：图片本地url
 return：UIView
 */
-(CoverCellView *)initCellView:(int)cellPosition
                     cellIndex:(int)cellIndex
                   cellSection:(int)cellSection
                       classID:(int)classID
                     imageName:(NSString *)imageName;

@end

@protocol ClassCoverViewDelegate <NSObject>
/*
 desc：点击封面
 parame：cellIndex：cell索引
 parame：classID：课程ID
 return：
 */
-(void)actionCoverCell:(int)cellIndex
               classID:(int)classID;
/*
 desc：长按封面
 parame：cellIndex：cell索引
 parame：classID：课程ID
 return：
 */
-(void)actionLongCoverCell:(int)cellIndex
                   classID:(int)classID;
/*
 desc：删除封面
 parame：cellIndex：cell索引
 parame：classID：课程ID
 return：
 */
-(void)actionCoverCellDelete:(int)cellIndex
                     classID:(int)classID;
@end

@interface CoverCellView : UIView

@property (nonatomic,assign) int classID;
@property (nonatomic,assign) int cellIndex;
@property (strong,nonatomic) UIImageView *imgCellBack;
@property (strong,nonatomic) UIButton *btnCell;
@property (strong,nonatomic) UIButton *btnCellDelete;

@end