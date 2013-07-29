//
//  ClassContentView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-24.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassContentView.h"

@implementation ClassContentView

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
    [_scrolCont release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    _scrolCont=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _scrolCont.pagingEnabled=YES;   //整页翻动
    [self addSubview:_scrolCont];
}

@end
