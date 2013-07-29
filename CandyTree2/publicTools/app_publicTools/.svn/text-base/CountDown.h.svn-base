//
//  CountDown.h
//  RWX_Passenger
//
//  Created by CL7RNEC on 13-3-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CountDownDelegate;

@interface CountDown : NSObject

@property (nonatomic,assign) int secondFlag;        //倒计总时长
@property (nonatomic,assign) int countDownFlag;     //倒计时长
@property (nonatomic,assign) id<CountDownDelegate> delegate;
@property (strong,nonatomic) NSDate *startDate;
@property (strong,nonatomic) NSDate *endDate;
@property (strong,nonatomic) NSTimer *timer;

/*
 desc：开启倒计时
 @param：date:开始时间
 @param：interval:时间间隔
 @param：second:时长，单位秒
 return：
 */
-(void)startCountDown:(NSDate *)date
             interval:(int)interval
               second:(int)second;
/*
 desc：倒计时过程
 @param：
 return：
 */
-(void)processCountDown;
@end

@protocol CountDownDelegate <NSObject>

/*
 desc：倒计时过程改变视图
 @param：
 return：
 */
-(void)processCountDownChangeView;
/*
 desc：倒计时结束改变视图
 @param：
 return：
 */
-(void)endCountDownChangeView;

@end
