//
//  BaiduMapController.m
//  MyWord
//
//  Created by CL7RNEC on 12-12-30.
//  Copyright (c) 2012年 CL7RNEC. All rights reserved.
//

#import "BaiduMapController.h"

@interface BaiduMapController ()

@end

@implementation BaiduMapController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [_mapManager release];
    [_mapView release];
    [_myLocation release];
    [_searchMap release];
    [super dealloc];
}
#pragma mark - init
+(BaiduMapController *)getInstance{
    static BaiduMapController *map;
    if(map==nil){
        map=[[BaiduMapController alloc]init];
    }
    return map;
}
+(BaiduMapController *)getInstanceRepeat:(int)flag{
    static BaiduMapController *map;
    if (flag==REPEAT_ONE) {
        if (map==nil) {
            map=[[BaiduMapController alloc]init];
        }
        else{
            [map release];
            map=[[BaiduMapController alloc]init];
        }
    }
    else{
        if (map==nil) {
            map=[[BaiduMapController alloc]init];
        }
    }
    return map;
}
-(void)initBaiduMap{
    _mapManager = [[BMKMapManager alloc]init];
	BOOL ret = [_mapManager start:BAIDU_ID generalDelegate:(id)self];    
	if (!ret) {
		NSLog(@"\n[manager start failed!]");
	}
}
-(BOOL)initData{    
    _searchMap = [[BMKSearch alloc]init];
    _searchMap.delegate=self;
    //自带定位
    if ([CLLocationManager locationServicesEnabled]&&[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusDenied) {
        _myLocation=[[CLLocationManager alloc]init];
        _myLocation.delegate=self;
        return YES;
    }
    else{
        return NO;
    }    
}
-(void)initMapView{
    _mapView=[[BMKMapView alloc]init];
    _mapView.delegate=self;
}
#pragma mark - other
-(BOOL)isOpenLocation{
    if ([CLLocationManager locationServicesEnabled]&&[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusDenied) {
        return YES;
    }
    else{
        return NO;
    }
}
-(BOOL)startLocation{
    if ([CLLocationManager locationServicesEnabled]&&[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusDenied) {
        [_myLocation startUpdatingLocation];
        _myLocation.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
        return YES;
    }
    else{
        return NO;
    }
    
}
-(void)closeLocation{
    [_myLocation stopUpdatingLocation];
    _myCoor.latitude=0;
    _myCoor.longitude=0;
}
-(void)startMapLocation{
    _mapView.showsUserLocation=YES;
    [_myLocation startUpdatingLocation];
    _myCoor.latitude=[[_myLocation location] coordinate].latitude+latitudeDisplacement;
    _myCoor.longitude=[[_myLocation location] coordinate].longitude+longitudeDisplacement;
}
-(void)closeMapLocation{
    _mapView.showsUserLocation=NO;
    [_myLocation stopUpdatingLocation];
}
-(void)locationZoomIn{
    _myLocation.desiredAccuracy=kCLLocationAccuracyKilometer;
}
-(void)locationZoomOut{
    _myLocation.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
}
-(void)getMyLocation{
    _myCoor.latitude=[[_myLocation location] coordinate].latitude+latitudeDisplacement;
    _myCoor.longitude=[[_myLocation location] coordinate].longitude+longitudeDisplacement;
}
-(void)backMyLocation{
    [_mapView setCenterCoordinate:_myCoor animated:YES];
}
-(void)mapZoomIn{
    [_mapView zoomIn];
}
-(void)mapZoomOut{
    [_mapView zoomOut];
}
#pragma mark - baiduDelegate
//用户位置更新
- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation{    
    _myCoor.latitude=userLocation.location.coordinate.latitude;
    _myCoor.longitude=userLocation.location.coordinate.longitude;
    if ([_delegate respondsToSelector:@selector(updateLocation)]) {
        [_delegate updateLocation];
    }
}
//点击标注
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
    if ([_delegate respondsToSelector:@selector(didSelectMapPoint:)]) {
        [_delegate didSelectMapPoint:view];
    }
}
//地图上添加标注
- (BMKAnnotationView *)mapView:(BMKMapView *)mV
             viewForAnnotation:(id <BMKAnnotation>)annotation{
    BMKAnnotationView *pinView=nil;
    if ( pinView == nil )
    {
        pinView = [[[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil]autorelease];
    }
    if(![annotation isKindOfClass:[BMKUserLocation class]]){
        pinView.annotation = annotation;
        pinView.canShowCallout = YES;
        if ([_delegate respondsToSelector:@selector(mapPoint:viewForAnnotation:)]) {
            [_delegate mapPoint:pinView viewForAnnotation:annotation];
        }
    }
    return pinView;
}
//地图移动结束
-(void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    if ([_delegate respondsToSelector:@selector(mapDidChange)]) {
        [_delegate mapDidChange];
    }
}
//获取地理位置
- (void)onGetAddrResult:(BMKAddrInfo*)result errorCode:(int)error{
    NSLog(@"\n[onGetAddrResult]%@,%@",result.strAddr,_delegate);
    if (error == BMKErrorOk&&_delegate) {
        if ([_delegate respondsToSelector:@selector(getAddrResult:)]) {
            [_delegate getAddrResult:result];
        }
    }
}
//获取批量地理位置
- (void)onGetPoiResult:(NSArray*)poiResultList searchType:(int)type errorCode:(int)error{
    if (error == BMKErrorOk) {
		BMKPoiResult* result = [poiResultList objectAtIndex:0];
        if ([_delegate respondsToSelector:@selector(getAddrResultList:)]) {
            [_delegate getAddrResultList:result];
        }
    }
}
#pragma mark locationDelegate
//用户位置更新
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    //NSLog(@"\n[didUpdateToLocation-ios4]%f",newLocation.coordinate.latitude);
    _myCoor.latitude=newLocation.coordinate.latitude+latitudeDisplacement;
    _myCoor.longitude=newLocation.coordinate.longitude+longitudeDisplacement;
    /*
    if ([_delegate respondsToSelector:@selector(updateLocation)]) {
        [_delegate updateLocation];
    }
    */
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //NSLog(@"\n[didUpdateToLocation-ios6]");
    _myCoor.latitude=manager.location.coordinate.latitude+latitudeDisplacement;
    _myCoor.longitude=manager.location.coordinate.longitude+longitudeDisplacement;
    /*
    if ([_delegate respondsToSelector:@selector(updateLocation)]) {
        [_delegate updateLocation];
    }
    */
}
-(void)locationManager: (CLLocationManager *)manager didFailLoadWithError:(NSError *)error{
    NSLog(@"\n[didFailLoadWithError]");
}
@end
