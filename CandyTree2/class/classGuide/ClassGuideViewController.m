//
//  ClassGuideViewController.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "ClassGuideViewController.h"
#import "ClassGuideView.h"
#import "ClassInfoView.h"

@interface ClassGuideViewController ()

@end

@implementation ClassGuideViewController

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
    [self initData];
    [self initView];
    [self testData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [_infoView release];
    [super dealloc];
}
#pragma mark - init
-(void)initData{
    
}
-(void)initView{
    //课程简介
    _infoView=[[ClassInfoView alloc]initWithFrame:CGRectMake(0, 0, 350, SCREEN_HEIGHT)];
    [self.view addSubview:_infoView];
    CGRect frame=_infoView.frame;
    //课程指导
    _guideView=[[ClassGuideView alloc]initWithFrame:CGRectMake(frame.size.width, 0, SCREEN_WIDTH-frame.size.width, SCREEN_HEIGHT)];
    [self.view addSubview:_guideView];
}
#pragma mark - other
-(void)testData{
    
}
#pragma mark -action
-(void)actionClassContent:(id)sender{
    
}
@end
