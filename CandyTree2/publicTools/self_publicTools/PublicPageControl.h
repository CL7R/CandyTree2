//
//  PublicPageControl.h
//  dbc2
//
//  Created by CL7RNEC on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicPageControl : UIPageControl

@property(nonatomic,assign) int pageSearch;                 //1存在搜索0没有
@property(nonatomic,retain) UIImage* activeSearImage;       //搜索选中
@property(nonatomic,retain) UIImage* inactiveSearImage;     //搜索未选中
@property(nonatomic,retain) UIImage* activeImage;           //选中
@property(nonatomic,retain) UIImage* inactiveImage;         //未选中


-(id) initWithFrame:(CGRect)frame 
         searchFlag:(int)searchFlag;
@end
