//
//  PublicTool.m
//  dbc
//
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicTool.h"

@implementation PublicTool
//计算两坐标距离
+(double)calculationDistance:(double)paramToLatitude 
                 toLongitude:(double)paramToLongitude 
                fromLatitude:(double)paramFromLatitude 
               fromLongitude:(double)paramFromLongitude{
    double R = 6371004; //地球半径
    double lat1 = paramToLatitude*M_PI/180.0;
    double lon1 = paramToLongitude*M_PI/180.0;
    double lat2 = paramFromLatitude*M_PI/180.0;
    double lon2 = paramFromLongitude*M_PI/180.0;
    return acos(sin(lat1) * sin(lat2) + cos(lat1) * cos(lat2) * cos(lon2 - lon1)) * R;
}
//获得两坐标间，基于维度的夹角，并得到方向
+(int)calculationAngleDirection:(double)paramToLatitude 
                    toLongitude:(double)paramToLongitude 
                   fromLatitude:(double)paramFromLatitude 
                  fromLongitude:(double)paramFromLongitude{
    int orientationFlag=0;
    //计算夹角
    float angle=atan(fabs(paramToLatitude-paramFromLatitude)/fabs(paramToLongitude-paramFromLongitude))/M_PI*180;
    //计算方向
    if (angle>0&&angle<7) {
        if(paramFromLongitude>paramToLongitude){
            orientationFlag=west;
        }
        else{
            orientationFlag=east;
        }
    }
    else if(angle>=7&&angle<=83){
        if (paramFromLatitude>paramToLatitude&&paramFromLongitude>paramToLongitude) {
            orientationFlag=southwest;
        }
        else if(paramFromLatitude>paramToLatitude&&paramFromLongitude<paramToLongitude) {
            orientationFlag=southeast;
        }
        else if(paramFromLatitude<paramToLatitude&&paramFromLongitude>paramToLongitude) {
            orientationFlag=nouthwest;
        }
        else{
            orientationFlag=noutheast;
        }
    }
    else{
        if (paramFromLatitude>paramToLatitude) {
            orientationFlag=south;
        }
        else{
            orientationFlag=nouth;
        }
    }
    return orientationFlag;
}
//获得两坐标间，基于维度的夹角，并得到方向
+(float)calculationAngle:(double)paramToLatitude 
             toLongitude:(double)paramToLongitude 
            fromLatitude:(double)paramFromLatitude 
           fromLongitude:(double)paramFromLongitude{
    //计算夹角
    float angle=atan((paramToLatitude-paramFromLatitude)/(paramToLongitude-paramFromLongitude))/M_PI*180;
    CGFloat heading = -1.0f * M_PI * angle / 180.0f;
    return heading;
}
@end
