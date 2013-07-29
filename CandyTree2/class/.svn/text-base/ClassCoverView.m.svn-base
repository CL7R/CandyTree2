//
//  ClassCoverView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassCoverView.h"

@interface ClassCoverView()
-(void)initView:(CGRect)frame;
/*
 desc：点击封面
 parame：
 return：
 */
-(void)actionCoverCell:(id)sender;
/*
 desc：长按封面
 parame：
 return：
 */
-(void)actionLongCoverCell:(id)sender;
/*
 desc：删除封面
 parame：
 return：
 */
-(void)actionCoverCellDelete:(id)sender;

@end

@implementation ClassCoverView

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
    [_scrolCover release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    _scrolCover=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _scrolCover.contentSize=CGSizeMake(SCREEN_WIDTH, 100);
    [_scrolCover setShowsHorizontalScrollIndicator:NO];
    [_scrolCover setShowsVerticalScrollIndicator:NO];
    [self addSubview:_scrolCover];
}
-(CoverCellView *)initCellView:(int)cellPosition
                     cellIndex:(int)cellIndex
                   cellSection:(int)cellSection
                       classID:(int)classID
                     imageName:(NSString *)imageName{
    CoverCellView *_cellView=[[CoverCellView alloc]initWithFrame:CGRectMake((cellSection*SCREEN_WIDTH)+(130*cellPosition+30), 15, 130, 100)];
    _cellView.classID=classID;
    _cellView.cellIndex=cellIndex;
    //背景框
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 120, 90)];
    _cellView.imgCellBack=img;
    if (classID!=0) {
        [_cellView.imgCellBack setImage:[UIImage imageWithContentsOfFile:imageName]];
    }
    else{
        [_cellView.imgCellBack setImage:[UIImage imageNamed:imageName]];
    }
    [img release];
    [_cellView addSubview:_cellView.imgCellBack];
    //图片按钮
    _cellView.btnCell=[UIButton buttonWithType:UIButtonTypeCustom];
    [_cellView.btnCell setFrame:CGRectMake(10, 10, 110, 80)];
    [_cellView.btnCell setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_cellView addSubview:_cellView.btnCell];
    [_cellView.btnCell addTarget:self action:@selector(actionCoverCell:) forControlEvents:UIControlEventTouchUpInside];
    //长按图片
    UILongPressGestureRecognizer *pahGestureRecognizer =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(actionLongCoverCell:)];
    pahGestureRecognizer.delegate = (id)self;           //指定委托
    pahGestureRecognizer.minimumPressDuration = 1;      //最少按压响应时间
    [_cellView.btnCell addGestureRecognizer:pahGestureRecognizer];
    [pahGestureRecognizer release];
    //删除按钮
    _cellView.btnCellDelete=[UIButton buttonWithType:UIButtonTypeCustom];
    [_cellView.btnCellDelete setFrame:CGRectMake(0, 0, 30, 30)];
    [_cellView.btnCellDelete setHidden:YES];
    [_cellView.btnCellDelete setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [_cellView addSubview:_cellView.btnCellDelete];
    [_cellView.btnCellDelete addTarget:self action:@selector(actionCoverCellDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *lab=[[UILabel alloc]init];
    [lab setFrame:CGRectMake(20, 20, 100, 30)];
    lab.text=[NSString stringWithFormat:@"%d",cellIndex];
    [_cellView addSubview:lab];
    
    return _cellView;
}
#pragma mark - action
-(void)actionCoverCell:(id)sender{
    UIButton *btn=(UIButton *)sender;
    CoverCellView *cover=(CoverCellView *)[btn superview];    
    if (_delegate!=nil&&[_delegate respondsToSelector:@selector(actionCoverCell:classID:)]) {
        [_delegate actionCoverCell:cover.cellIndex classID:cover.classID];
    }
}
-(void)actionLongCoverCell:(id)sender{
    UILongPressGestureRecognizer *longPres=(UILongPressGestureRecognizer *)sender;
    UIButton *btn=(UIButton *)longPres.view;
    CoverCellView *cover=(CoverCellView *)[btn superview];
    if (_delegate!=nil&&[_delegate respondsToSelector:@selector(actionLongCoverCell:classID:)]) {
        [_delegate actionLongCoverCell:cover.cellIndex classID:cover.classID];
    }
}
-(void)actionCoverCellDelete:(id)sender{
    UIButton *btn=(UIButton *)sender;
    CoverCellView *cover=(CoverCellView *)[btn superview];
    if (_delegate!=nil&&[_delegate respondsToSelector:@selector(actionCoverCellDelete:classID:)]) {
        [_delegate actionCoverCellDelete:cover.cellIndex classID:cover.classID];
    }
}
@end

@implementation CoverCellView

-(void)dealloc{
    [_imgCellBack release];
    [_btnCell release];
    [_btnCellDelete release];
    [super dealloc];
}

@end