//
//  ClassInfoView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassInfoView.h"

@implementation ClassInfoView

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
    [_labTitle release];
    [_labAuthor release];
    [_imgCollect release];
    [_labCollect release];
    [_labCollectName release];
    [_labComment release];
    [_btnClass release];
    [_labClassText release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    //标题
    _labTitle=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [self addSubview:_labTitle];
    //作者
    _labAuthor=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [self addSubview:_labAuthor];
    //收藏次数
    _imgCollect=[[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [_imgCollect setImage:[UIImage imageNamed:@"btn"]];
    [self addSubview:_imgCollect];
    _labCollect=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [self addSubview:_labCollect];
    _labCollectName=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [self addSubview:_labCollectName];    
    //评论次数
    _imgComment=[[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [_imgComment setImage:[UIImage imageNamed:@"btn"]];
    [self addSubview:_imgCollect];
    _labComment=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 80, 30)];
    [self addSubview:_labComment];
    _labCommentName=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [self addSubview:_labCommentName];
    //课程图片
    _imgClassInfo=[[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 50, 30)];
    [_imgClassInfo setImage:[UIImage imageNamed:@"btn"]];
    [self addSubview:_imgClassInfo];
    //课程信息
    _labClassText=[[UILabel alloc]initWithFrame:CGRectMake(20, 200, 150, 100)];
    [self addSubview:_labClassText];
    //进入课程
    _btnClass=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btnClass retain];
    [_btnClass setFrame:CGRectMake(20, 100, 150, 40)];
    [_btnClass setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    [self addSubview:_btnClass];
}
@end
