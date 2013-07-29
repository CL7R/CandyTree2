//
//  PublicTool.h
//  dbc
//  工具类，各种常用的工具
//  Created by CL7RNEC on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//方向枚举
typedef enum{
    south=1,
    nouth=2,
    west=3,
    east=4,
    southeast=5,
    southwest=6,
    noutheast=7,
    nouthwest=8
}orientation;
@interface PublicTool : NSObject
/*
 desc：计算两坐标间距离
 @parame:paramToLatitude：终点纬度
 @parame:paramToLongitude：终点经度
 @parame:paramFromLatitude：起点纬度
 @parame:paramFromLongitude：起点经度
 return：double
 */
+(double)calculationDistance:(double)paramToLatitude 
                 toLongitude:(double)paramToLongitude 
                fromLatitude:(double)paramFromLatitude 
               fromLongitude:(double)paramFromLongitude;
/*
 desc：获得两坐标间，基于纬度的夹角方向
 @parame:paramToLatitude：终点纬度
 @parame:paramToLongitude：终点经度
 @parame:paramFromLatitude：起点纬度
 @parame:paramFromLongitude：起点经度
 return：int
 */
+(int)calculationAngleDirection:(double)paramToLatitude 
                    toLongitude:(double)paramToLongitude 
                   fromLatitude:(double)paramFromLatitude 
                  fromLongitude:(double)paramFromLongitude;
/*
 desc：获得两坐标间，基于维度的夹角
 @parame:paramToLatitude：终点纬度
 @parame:paramToLongitude：终点经度
 @parame:paramFromLatitude：起点纬度
 @parame:paramFromLongitude：起点经度
 return:float
 */
+(float)calculationAngle:(double)paramToLatitude 
             toLongitude:(double)paramToLongitude 
            fromLatitude:(double)paramFromLatitude 
           fromLongitude:(double)paramFromLongitude;
@end
