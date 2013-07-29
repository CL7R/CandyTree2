//
//  ClassGuideView.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassGuideView.h"

@implementation ClassGuideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    [_scrolGuide release];
    [super dealloc];
}
#pragma mark - init
-(void)initView:(CGRect)frame{
    _scrolGuide=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:_scrolGuide];
    //年龄标题
    
}
@end
