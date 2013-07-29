//
//  BackgroundView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "BackgroundView.h"

@interface BackgroundView()
-(void)initView:(CGRect)frame;
@end

@implementation BackgroundView

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
    [_scrolBack release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    _scrolBack=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _scrolBack.pagingEnabled=YES;   //整页翻动
    [self addSubview:_scrolBack];
}
@end
