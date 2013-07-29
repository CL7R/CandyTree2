//
//  CountDown.m
//  RWX_Passenger
//
//  Created by CL7RNEC on 13-3-13.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "CountDown.h"

@implementation CountDown

-(void)startCountDown:(NSDate *)date
             interval:(int)interval
               second:(int)second{
    _startDate=date;
    [_startDate retain];
    _secondFlag=second;
    _countDownFlag=0;
    _timer=[NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(processCountDown)
                                          userInfo:nil
                                           repeats:YES];
    NSLog(@"\n[startCountDown-1]%d,%@,%@",interval,_startDate,[NSDate date]);
}
-(void)processCountDown{
    //计算时间间隔
    NSDate *date=[NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSTimeInterval distance = [_startDate timeIntervalSinceDate:[date dateByAddingTimeInterval: interval]];
    NSLog(@"\n[processCountDown-1]%d,%@,%@",(int)ABS(distance),_startDate,date);
    if ((int)ABS(distance)>=_secondFlag) {
        [_timer invalidate];
        if (_delegate!=nil&&[_delegate respondsToSelector:@selector(endCountDownChangeView)]) {
            [_delegate endCountDownChangeView];
        }
    }
    else{
        _countDownFlag=(int)ABS(distance);
        NSLog(@"\n[processCountDown-2]%d,%@",_countDownFlag,_delegate);
        if (_delegate!=nil&&[_delegate respondsToSelector:@selector(processCountDownChangeView)]) {
            [_delegate processCountDownChangeView];
        }
    }
}
@end
