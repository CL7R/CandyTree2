//
//  PublicStyle.m
//  dbc
//  涉及到
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicStyle.h"

@implementation PublicStyle
//初始化样式
+(void)initStyle:(int)styleFlag{
    if (styleFlag==1) {
        //导航栏
        imgHead=[UIImage imageNamed:@"top"];
        [imgHead retain];
        imgHeadBack=[UIImage imageNamed:@"btnBack"];
        [imgHeadBack retain];
        //主页
        imgMore=[UIImage imageNamed:@"btnMore"];
        [imgMore retain];
        imgMyLocation=[UIImage imageNamed:@"btnMyLocation"];
        [imgMyLocation retain];
        imgZoomIn=[UIImage imageNamed:@"btnZoomIn"];
        [imgZoomIn retain];
        imgZoomOut=[UIImage imageNamed:@"btnZoomOut"];
        [imgZoomOut retain];
        imgFun=[UIImage imageNamed:@"bottom"];
        [imgFun retain];
        imgRelease=[UIImage imageNamed:@"btnTakeTaxi"];
        [imgRelease retain];
        imgCancel=[UIImage imageNamed:@"btnCancel"];
        [imgCancel retain];
        imgOrder=[UIImage imageNamed:@"btnIndent"];
        [imgOrder retain];
        imgUser=[UIImage imageNamed:@"btnUser"];
        [imgUser retain];
        imgOk=[UIImage imageNamed:@"btnTakeTaxi"];
        [imgOk retain];
        imgCall=[UIImage imageNamed:@"btnTakeTaxi"];
        [imgCall retain];
        imgCarDirectionE=[UIImage imageNamed:@"mapCarE"];
        [imgCarDirectionE retain];
        imgCarDirectionW=[UIImage imageNamed:@"mapCarW"];
        [imgCarDirectionW retain];
        imgCarDirectionS=[UIImage imageNamed:@"mapCarS"];
        [imgCarDirectionS retain];
        imgCarDirectionN=[UIImage imageNamed:@"mapCarN"];
        [imgCarDirectionN retain];
        imgCarDirectionES=[UIImage imageNamed:@"mapCarSE"];
        [imgCarDirectionES retain];
        imgCarDirectionEN=[UIImage imageNamed:@"mapCarNE"];
        [imgCarDirectionEN retain];
        imgCarDirectionWS=[UIImage imageNamed:@"mapCarSW"];
        [imgCarDirectionWS retain];
        imgCarDirectionWN=[UIImage imageNamed:@"mapCarNW"];
        [imgCarDirectionWN retain];
        imgCarDirection=[UIImage imageNamed:@"mapCar"];
        [imgCarDirection retain];
        imgDealOk=[UIImage imageNamed:@"btnSealADeal"];
        [imgDealOk retain];
        imgPhone=[UIImage imageNamed:@"btnPhone"];
        [imgPhone retain];
        imgPassenger=[UIImage imageNamed:@"mapUser"];
        [imgPassenger retain];
        //发布打车
        imgMap=[UIImage imageNamed:@"btnDirection"];
        [imgMap retain];
        imgFeeAdd=[UIImage imageNamed:@"btnUp"];
        [imgFeeAdd retain];
        imgFeeSub=[UIImage imageNamed:@"btnDown"];
        [imgFeeSub retain];
        imgGoTime=[UIImage imageNamed:@"btnTime"];
        [imgGoTime retain];
        imgReleaseTaxi=[UIImage imageNamed:@"btnRelease"];
        [imgReleaseTaxi retain];
        imgCenter=[UIImage imageNamed:@"btnCenterPoint"];
        [imgCenter retain];
        imgPlaceOk=[UIImage imageNamed:@"btnButtonAll"];
        [imgPlaceOk retain];
        //用户
        imgVerifi=[UIImage imageNamed:@"btnAuthCode"];
        [imgVerifi retain];
        imgLogin=[UIImage imageNamed:@"btnLogin"];
        [imgLogin retain];
        imgRecharge=[UIImage imageNamed:@"btnTopup"];
        [imgRecharge retain];
        imgDetail=[UIImage imageNamed:@"btnDetail"];
        [imgDetail retain];
        imgLogout=[UIImage imageNamed:@"btnLogout"];
        [imgLogout retain];
        //订单
        imgComplain=[UIImage imageNamed:@"btnComplain"];
        [imgComplain retain];
        imgOk2=[UIImage imageNamed:@"btnOk"];
        [imgOk2 retain];
        //颜色
        colorBackground=[[UIColor alloc] initWithRed:0.9372 green:0.9411 blue:0.9411 alpha:1];
        colorBar=[[UIColor alloc] initWithRed:0.7019 green:0.7019 blue:0.7019 alpha:1];
    }
    else if(styleFlag==2){
        
    }
    else{
        
    }
}
@end
