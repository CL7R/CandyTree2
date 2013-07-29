//
//  ClassGuideView.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-20.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassGuideView : UIView

@property (strong,nonatomic) UIScrollView *scrolGuide;
@property (strong,nonatomic) UIImageView *imgCutLineVertical;
@property (strong,nonatomic) UIImageView *imgAge;
@property (strong,nonatomic) UIImageView *imgCutLineHorizontal;
@property (strong,nonatomic) UIImageView *imgBubble;
@property (strong,nonatomic) UILabel *labGuideTitle;
@property (strong,nonatomic) UILabel *labGuideText;

-(void)initView:(CGRect)frame;
@end
