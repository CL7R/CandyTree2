//
//  ClassPreviewView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassPreviewView.h"

@interface ClassPreviewView()
-(void)initView:(CGRect)frame;
/*
 desc：下载课程
 parame：
 return：
 */
-(void)actionDownload:(id)sender;
/*
 desc：关闭视图
 parame：
 return：
 */
-(void)actionCloseView:(id)sender;
/*
 desc：课程预览
 parame：
 return：
 */
-(void)actionClassGuidance:(id)sender;
/*
 desc：课程内容
 parame：
 return：
 */
-(void)actionClassContent:(id)sender;
/*
 desc：收藏课程
 parame：
 return：
 */
-(void)actionCollect:(id)sender;
/*
 desc：播放课程
 parame：
 return：
 */
-(void)actionPlay:(id)sender;
@end

@implementation ClassPreviewView

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
    [_scrolPreview release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    _scrolPreview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _scrolPreview.pagingEnabled=YES;
    _scrolPreview.showsHorizontalScrollIndicator=NO;
    _scrolPreview.showsVerticalScrollIndicator=NO;
    [self addSubview:_scrolPreview];
}
-(PreviewCellView *)initPreviewCellView:(int)cellIndex
                                classID:(id)classID
                              imageName:(NSString *)imageName
                              classInfo:(NSString *)classInfo{
    PreviewCellView *preview=[[PreviewCellView alloc]initWithFrame:CGRectMake(200+cellIndex*SCREEN_WIDTH, 0, 750, 300)];
    preview.classID=classID;
    preview.cellIndex=cellIndex;
    CGRect frame=preview.frame;
    //背景
    preview.imgBackground=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [preview.imgBackground setUserInteractionEnabled:YES];
    [preview.imgBackground setImage:[UIImage imageWithContentsOfFile:imageName]];
    [preview addSubview:preview.imgBackground];
    //课程简介
    preview.labClassText=[[UILabel alloc]initWithFrame:CGRectMake(frame.size.width, 50, 100, 100)];    
    preview.labClassText.lineBreakMode =UILineBreakModeWordWrap;
    preview.labClassText.numberOfLines=3;
    [preview.labClassText setText:classInfo];
    [preview addSubview:preview.labClassText];
    //下载
    //关闭
    preview.btnCloseView=[UIButton buttonWithType:UIButtonTypeCustom];
    [preview.btnCloseView setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [preview.btnCloseView setFrame:CGRectMake(600, 250, 50, 30)];
    [preview addSubview:preview.btnCloseView];
    //课程指导
    //课程内容
    //课程收藏
    //播放
    
    UILabel *lab=[[UILabel alloc]init];
    [lab setFrame:CGRectMake(20, 20, 100, 30)];
    lab.text=[NSString stringWithFormat:@"%d",cellIndex];
    [preview addSubview:lab];
    return preview;
}
#pragma mark - action
-(void)actionDownload:(id)sender{
    
}
-(void)actionCloseView:(id)sender{
    
}
-(void)actionClassGuidance:(id)sender{
    
}
-(void)actionClassContent:(id)sender{
    
}
-(void)actionCollect:(id)sender{
    
}
-(void)actionPlay:(id)sender{
    
}
@end

@implementation PreviewCellView

-(void)dealloc{
    [_imgBackground release];
    [_labClassText release];
    [_btnClassContent release];
    [_btnClassGuidance release];
    [_btnCloseView release];
    [_btnCollect release];
    [_btnDownload release];
    [_btnPlay release];
    [super dealloc];
}

@end
