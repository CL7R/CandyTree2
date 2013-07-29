//
//  BaiduMapController.h
//  MyWord
//  百度地图
//  Created by CL7RNEC on 12-12-30.
//  Copyright (c) 2012年 CL7RNEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BMapKit.h"

#define BAIDU_ID @"DB2097F89A63502B47C4C3C76C62D830C71CB034"
#define longitudeDisplacement   0.012713     //经度偏移值google偏移0.00615
#define latitudeDisplacement    0.007077     //维度偏移值google偏移0.00145
typedef enum{
    REPEAT_MORE=0,
    REPEAT_ONE
}repeatType;

@protocol BaiduMapDelegate;

@interface BaiduMapController : UIViewController<BMKMapViewDelegate,BMKAnnotation,BMKSearchDelegate,CLLocationManagerDelegate>

@property(nonatomic,assign) id<BaiduMapDelegate> delegate;
@property(nonatomic,assign) CLLocationCoordinate2D myCoor;
@property(strong,nonatomic) CLLocationManager *myLocation;
@property(strong,nonatomic) BMKMapManager* mapManager;
@property(strong,nonatomic) BMKMapView *mapView;
@property(strong,nonatomic) BMKSearch *searchMap;
/*
 desc:获取单例
 @parame:
 return:BaiduMapController
 */
+(BaiduMapController *)getInstance;
/*
 desc：获取单例
 @parame：
 newObject：0复用1新建实例
 return：BaiduMapController
 */
+(BaiduMapController *)getInstanceRepeat:(int)flag;
/*
 desc:初始化百度地图
 @parame
 return:
 */
-(void)initBaiduMap;
/*
 desc:初始化
 @parame
 return:
 */
-(BOOL)initData;
/*
 desc:初始化地图
 @parame
 return:
 */
-(void)initMapView;
/*
 desc:是否开启定位
 @parame
 return:
 */
-(BOOL)isOpenLocation;
/*
 desc:开启location更新
 @parame
 return:
 */
-(BOOL)startLocation;
/*
 desc:关闭location更新
 @parame
 return:
 */
-(void)closeLocation;
/*
 desc:开启定位
 @parame
 return:
 */
-(void)startMapLocation;
/*
 desc:关闭定位
 @parame
 return:
 */
-(void)closeMapLocation;
/*
 desc:提高定位精度
 @parame
 return:
 */
-(void)locationZoomIn;
/*
 desc:降低定位精度
 @parame
 return:
 */
-(void)locationZoomOut;
/*
 desc:获取当前位置
 @parame
 return:
 */
-(void)getMyLocation;
/*
 desc:回到当前位置
 @parame
 return:
 */
-(void)backMyLocation;
/*
 desc:放大地图
 @parame
 return:
 */
-(void)mapZoomIn;
/*
 desc:缩小地图
 @parame
 return:
 */
-(void)mapZoomOut;
@end

@protocol BaiduMapDelegate <NSObject>
/*
 desc:获取最新经纬度时触发事件
 @parame
 return:
 */
-(void)updateLocation;
/*
 desc:地图标注
 @parame
 return:
 */
-(void)mapPoint:(BMKAnnotationView *)annotationView
viewForAnnotation:(id <BMKAnnotation>)annotation;
/*
 desc:点击地图标注
 @parame
 return:
 */
-(void)didSelectMapPoint:(BMKAnnotationView *)annotationView;
/*
 desc:获取地理结果
 @parame
 return:
 */
-(void)getAddrResult:(BMKAddrInfo*)result;
/*
 desc:批量获取地理结果
 @parame
 return:
 */
-(void)getAddrResultList:(BMKPoiResult *)resultList;
/*
 desc:移动地图结束
 @parame
 return:
 */
-(void)mapDidChange;
@end