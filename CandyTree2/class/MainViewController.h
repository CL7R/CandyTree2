//
//  MainViewController.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-15.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundView.h"
#import "ClassCoverView.h"
#import "ClassPreviewView.h"
#import "FrontCoverManger.h"
@class BackgroundManager;
@interface MainViewController : UIViewController<ClassCoverViewDelegate,ClassPreviewViewDelegate,UIScrollViewDelegate>

@property (strong,nonatomic) BackgroundView *backView;
@property (strong,nonatomic) ClassCoverView *coverView;
@property (strong,nonatomic) ClassPreviewView *preView;
@property (strong,nonatomic) NSMutableArray *muArrCover;
@property (strong,nonatomic) NSMutableArray *muArrPreview;
@property (strong,nonatomic) BackgroundManager *bgManage;
@property (strong,nonatomic) FrontCoverManger *fcManage;

@end
