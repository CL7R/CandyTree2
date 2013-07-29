//
//  PublicView.m
//  dbc2
//
//  Created by CL7RNEC on 12-6-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicView.h"
#import <QuartzCore/QuartzCore.h>
@implementation PublicView


+(void)initLabel:(UILabel *)label 
       isDefault:(int)isDefault
        textSize:(int)textSize
       textColor:(UIColor *)textColor{
    if (isDefault==1) {
        [label setFont:[UIFont systemFontOfSize:13]];
        [label setTextColor:[UIColor blackColor]];
        [label setBackgroundColor:[UIColor clearColor]];
    }
    else{
        [label setFont:[UIFont systemFontOfSize:textSize]];
        [label setTextColor:textColor];
        [label setBackgroundColor:[UIColor clearColor]];
    }
}
+(void)initTextField:(UITextField *)tex 
           isDefault:(int)isDefault
            textSize:(int)textSize
           textColor:(UIColor *)textColor{
    if (isDefault==1) {
        [tex setFont:[UIFont systemFontOfSize:13]];
        [tex setTextColor:[UIColor blackColor]];
        [tex setBackgroundColor:[UIColor clearColor]];
    }
    else{
        [tex setFont:[UIFont systemFontOfSize:textSize]];
        [tex setTextColor:textColor];
        [tex setBackgroundColor:[UIColor clearColor]];
    }
}
+(void)initButton:(UIButton *)btn 
        isDefault:(int)isDefault
         textSize:(int)textSize
        textColor:(UIColor *)textColor
        btnBacImg:(UIImage *)btnBacImg{
    if (isDefault==1) {
        [btn setFont:[UIFont systemFontOfSize:13]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:btnBacImg forState:UIControlStateNormal];
    }
    else{
        [btn setFont:[UIFont systemFontOfSize:textSize]];
        [btn setTitleColor:textColor forState:UIControlStateNormal];
        [btn setBackgroundImage:btnBacImg forState:UIControlStateNormal];
    }
}
+(void)initViewBorder:(UIView *)view{
    [view.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [view.layer setBorderWidth:1.0];
    [view.layer setCornerRadius:8.0];
    [view.layer setMasksToBounds:YES];
    [view setClipsToBounds:YES];
}
@end
