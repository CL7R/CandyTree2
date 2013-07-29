//
//  ClassPreviewView.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PreviewCellView;

@protocol ClassPreviewViewDelegate;

@interface ClassPreviewView : UIView

@property (nonatomic,assign) id<ClassPreviewViewDelegate> delegate;
@property (strong,nonatomic) UIScrollView *scrolPreview;

/*
 desc：预览cell视图
 parame：cellIndex：cell索引
 parame：classID：课程ID
 parame：imageName：图片本地url
 parame：classID：课程简介
 return：UIView
 */
-(PreviewCellView *)initPreviewCellView:(int)cellIndex
                                classID:(id)classID
                              imageName:(NSString *)imageName
                              classInfo:(NSString *)classInfo;

@end

@protocol ClassPreviewViewDelegate <NSObject>
/*
 desc：下载课程
 parame：
 return：
 */
-(void)actionDownload:(int)cellIndex
              classID:(int)classID;
/*
 desc：关闭视图
 parame：
 return：
 */
-(void)actionCloseView:(int)cellIndex
               classID:(int)classID;
/*
 desc：课程预览
 parame：
 return：
 */
-(void)actionClassGuidance:(int)cellIndex
                   classID:(int)classID;
/*
 desc：课程内容
 parame：
 return：
 */
-(void)actionClassContent:(int)cellIndex
                  classID:(int)classID;
/*
 desc：收藏课程
 parame：
 return：
 */
-(void)actionCollect:(int)cellIndex
             classID:(int)classID;
/*
 desc：播放课程
 parame：
 return：
 */
-(void)actionPlay:(int)cellIndex
          classID:(int)classID;
@end

@interface PreviewCellView : UIView

@property (nonatomic,assign) int cellIndex;
@property (nonatomic,assign) int classID;
@property (strong,nonatomic) UIImageView *imgBackground;
@property (strong,nonatomic) UILabel *labClassText;
@property (strong,nonatomic) UIButton *btnDownload;
@property (strong,nonatomic) UIButton *btnCloseView;
@property (strong,nonatomic) UIButton *btnClassGuidance;
@property (strong,nonatomic) UIButton *btnClassContent;
@property (strong,nonatomic) UIButton *btnCollect;
@property (strong,nonatomic) UIButton *btnPlay;

@end
