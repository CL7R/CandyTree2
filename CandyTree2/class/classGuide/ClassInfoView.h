//
//  ClassInfoView.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassInfoView : UIView

@property (strong,nonatomic) UILabel *labTitle;
@property (strong,nonatomic) UILabel *labAuthor;
@property (strong,nonatomic) UIImageView *imgCollect;
@property (strong,nonatomic) UILabel *labCollect;
@property (strong,nonatomic) UILabel *labCollectName;
@property (strong,nonatomic) UIImageView *imgComment;
@property (strong,nonatomic) UILabel *labComment;
@property (strong,nonatomic) UILabel *labCommentName;
@property (strong,nonatomic) UIImageView *imgClassInfo;
@property (strong,nonatomic) UIButton *btnClass;
@property (strong,nonatomic) UILabel *labClassText;

-(void)initView:(CGRect)frame;

@end
