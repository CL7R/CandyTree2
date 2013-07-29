//
//  PublicRating.h
//  dbc2
//
//  Created by CL7RNEC on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RatingViewDelegate;

@interface PublicRating : UIView 

@property(nonatomic,assign) id<RatingViewDelegate> delegate;  //代理
@property(nonatomic,assign) float starRating;
@property(nonatomic,assign) float lastRating;
@property(nonatomic,assign) float height;
@property(nonatomic,assign) float width;
@property (nonatomic, retain) UIImage *unselectedImage;
@property (nonatomic, retain) UIImage *partlySelectedImage;
@property (nonatomic, retain) UIImage *fullySelectedImage;
@property (nonatomic, retain) UIImageView *s1;
@property (nonatomic, retain) UIImageView *s2;
@property (nonatomic, retain) UIImageView *s3;
@property (nonatomic, retain) UIImageView *s4;
@property (nonatomic, retain) UIImageView *s5;


-(UIView *)setImagesDeselected:(NSString *)unselectedImage 
            partlySelected:(NSString *)partlySelectedImage 
			  fullSelected:(NSString *)fullSelectedImage 
               andDelegate:(id<RatingViewDelegate>)object;
-(void)displayRating:(float)rating;
-(float)rating;
@end

@protocol RatingViewDelegate
-(void)ratingChanged:(float)newRating;
@end