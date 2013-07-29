//
//  MainViewController.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "MainViewController.h"
#import "BackgroundManager.h"
#import "FrontCoverManger.h"
#import "UserInfoManager.h"
@interface MainViewController ()
-(void)initData;
-(void)initView;
/*
 desc：测试数据
 parame：
 return：
 */
-(void)testData;
/*
 desc：获取背景
 parame：
 return：
 */
-(void)getBackground;
/*
 desc：获取课程封面&预览信息
 parame：
 return：
 */
-(void)getClassCover;
/*
 desc：是否已付费
 parame：
 return：
 */
-(BOOL)isPayed;
/*
 desc：是否普通
 parame：
 return：
 */
-(BOOL)isNormal;
/*
 desc：是否学校
 parame：
 return：
 */
-(BOOL)isSchool;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.    
    [self initView];
    [self initData];
    //[self testData];
    [self getBackground];
    [self getClassCover];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [_backView release];
    [_coverView release];
    [_preView release];
    [_muArrCover release];
    [_muArrPreview release];
    [_bgManage release];
    [_fcManage release];
    [super dealloc];
}
#pragma mark - init
-(void)initData{
    _muArrCover=[[NSMutableArray alloc]init];
    _muArrPreview=[[NSMutableArray alloc]init];    
    //获取课程封面信息
}
-(void)initView{
    _backView=[[BackgroundView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _coverView=[[ClassCoverView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150, SCREEN_WIDTH, 100)];
    _preView=[[ClassPreviewView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 300)];
    [self.view addSubview:_backView];
    [self.view addSubview:_coverView];
    [self.view addSubview:_preView];
    _coverView.delegate=(id)self;
    _preView.delegate=(id)self;
    _preView.scrolPreview.delegate=(id)self;
}
#pragma mark - prevate
-(void)testData{
    int count=10;
    //背景
    CLog(@"\n[testData]%f",SCREEN_WIDTH);
    _backView.scrolBack.contentSize=CGSizeMake(SCREEN_WIDTH*count, SCREEN_HEIGHT);
    for (int i=0; i<count; i++) {
        CGRect frame = _backView.scrolBack.frame;
        frame.origin.x = frame.size.width * i;
        UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn"]];
        [img setFrame:frame];
        [_backView.scrolBack addSubview:img];
        [img release];
    }
    //封面
    int coverCount=(count-1)/6+1;
    _coverView.scrolCover.contentSize=CGSizeMake(SCREEN_WIDTH*coverCount, 100);
    for (int j = 0; j<coverCount; j++) {
        for (int i=0; i<6; i++) {
            if (i+j*6<count) {
                UIView *view=[_coverView initCellView:i cellIndex:i+j*6 cellSection:j classID:0];
                [_muArrCover addObject:view];
                [_coverView.scrolCover addSubview:view];
            }            
        }
    }
    //预览
    _preView.scrolPreview.contentSize=CGSizeMake(SCREEN_WIDTH*count, 100);
    for (int i=0; i<count; i++) {
        UIView *view=[_preView initPreviewCellView:i classID:0];
        [_muArrPreview addObject:view];
        [_preView.scrolPreview addSubview:view];
    }
}
-(void)getBackground{
    _bgManage=[[BackgroundManager alloc]init];
    dispatch_queue_t thread=dispatch_queue_create("threadBg", NULL);
    dispatch_async(thread, ^{
        NSArray *arr=[_bgManage getAllImages];
        int count=[arr count];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (count>0) {
                int i=0;
                _backView.scrolBack.contentSize=CGSizeMake(SCREEN_WIDTH*count, SCREEN_HEIGHT);
                for (NSString *str in arr) {
                    CGRect frame = _backView.scrolBack.frame;
                    frame.origin.x = frame.size.width * i++;
                    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile: str]];
                    [img setFrame:frame];
                    [_backView.scrolBack addSubview:img];
                    [img release];
                }
            }
            else{
                //默认背景
                
            }
        });
    });
}
-(void)getClassCover{
    UserInfoManager *user=[UserInfoManager shareInstance];
    _fcManage=[[FrontCoverManger alloc]init];
    dispatch_queue_t thread=dispatch_queue_create("threadCover", NULL);
    dispatch_async(thread, ^{
        NSArray *arr=[_fcManage getFrontCoverInfoByClassType:user.userType];
        int count=[arr count];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (count>0) {                
                int coverCount=(count-1)/6+1;
                int i = 0,j=0;
                _coverView.scrolCover.contentSize=CGSizeMake(SCREEN_WIDTH*coverCount, 100);
                _preView.scrolPreview.contentSize=CGSizeMake(SCREEN_WIDTH*count, 100);
                for (FrontCoverInfo *fcInfo in arr) {
                    int index=i+j*6;
                    //封面
                    if ((i!=0)&&i%6==0) {
                        ++j;
                        i=0;
                    }
                    else{
                        UIView *view=[_coverView initCellView:i cellIndex:index cellSection:j classID:fcInfo.classID imageName:fcInfo.imageName];
                        [_muArrCover addObject:view];
                        [_coverView.scrolCover addSubview:view];
                        ++i;
                    }
                    //预览
                    UIView *view=[_preView initPreviewCellView:index classID:fcInfo.classID imageName:fcInfo.imageName classInfo:fcInfo.classSummery];
                    [_muArrPreview addObject:view];
                    [_preView.scrolPreview addSubview:view];
                }
                //是否有购买封面
                if ([self isNormal]) {
                    UIView *view=[_coverView initCellView:i cellIndex:index cellSection:j classID:0 imageName:@"btn"];
                    [_muArrCover addObject:view];
                    [_coverView.scrolCover addSubview:view];
                }
            }
        });
    });
}

-(BOOL)isPayed{
    UserInfoManager *user=[UserInfoManager shareInstance];
    if (user.userType==2) {
        return YES;
    }
    else{
        return NO;
    }
}
-(BOOL)isNormal{
    UserInfoManager *user=[UserInfoManager shareInstance];
    if (user.userType==1) {
        return YES;
    }
    else{
        return NO;
    }
}
-(BOOL)isSchool{
    UserInfoManager *user=[UserInfoManager shareInstance];
    if (user.userType==4) {
        return YES;
    }
    else{
        return NO;
    }
}
#pragma mark - ClassCoverViewDelegate
-(void)actionCoverCell:(int)cellIndex
               classID:(int)classID{
    CLog(@"\n[actionCoverCellDelegate]%d,%d",cellIndex,classID);
    if (classID!=0) {
        PreviewCellView *preCell=(PreviewCellView *)[_muArrPreview objectAtIndex:cellIndex];
        CGRect frame=preCell.frame;
        frame.origin.x=SCREEN_WIDTH*cellIndex;
        [_preView.scrolPreview scrollRectToVisible:frame animated:YES];
    }
    else{
        //购买提示框
        
    }
}
-(void)actionLongCoverCell:(int)cellIndex
                   classID:(int)classID{
    if ([self isPayed]) {
        CoverCellView *cell=(CoverCellView *)[_muArrCover objectAtIndex:cellIndex];
        [cell.btnCellDelete setHidden:NO];
    }    
}
-(void)actionCoverCellDelete:(int)cellIndex
                     classID:(int)classID{
    //封面
    CoverCellView *cell=(CoverCellView *)[_muArrCover objectAtIndex:cellIndex];
    CGRect frameCurr=cell.frame;
    int tagCurr=cell.cellIndex;
    [cell removeFromSuperview];
    [_muArrCover removeObjectAtIndex:cellIndex];
    //预览
    PreviewCellView *preCell=(PreviewCellView *)[_muArrPreview objectAtIndex:cellIndex];
    CGRect preFrameCurr=preCell.frame;
    [preCell removeFromSuperview];
    [_muArrPreview removeObjectAtIndex:cellIndex];
    //将后面的cell往前移
    for (int i=cellIndex; i<[_muArrCover count]; i++) {
        //封面
        CoverCellView *cell=(CoverCellView *)[_muArrCover objectAtIndex:i];
        CGRect frame=cell.frame;
        int tag=cell.cellIndex;
        cell.frame=frameCurr;
        cell.cellIndex=tagCurr;
        //预览
        PreviewCellView *preCell=(PreviewCellView *)[_muArrPreview objectAtIndex:cellIndex];
        CGRect preFrame=preCell.frame;
        preCell.frame=preFrameCurr;
        preCell.cellIndex=tagCurr;
        
        preFrameCurr=preFrame;
        frameCurr=frame;
        tagCurr=tag;
    }
}
#pragma mark scrollViewDelegate
//滚动预览视图时级联封面视图
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scView{
    CGFloat pageWidth = scView.frame.size.width;
    int page = floor((scView.contentOffset.x - pageWidth / 2) / pageWidth)+1;
    int coverPage=page/6;
    CLog(@"\n[scrollViewDidEndDecelerating]%d",page);
    CGRect frame=_coverView.scrolCover.frame;
    frame.origin.x=coverPage*SCREEN_WIDTH;
    [_coverView.scrolCover scrollRectToVisible:frame animated:YES];
}
@end
