//
//  PublicPicture.m
//  dbc
//
//  Created by CL7RNEC on 12-4-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PublicPicture.h"
#import <QuartzCore/QuartzCore.h>
@implementation PublicPicture
+(UIImage*)captureView:(UIView *)paramView{
    CGRect rect = paramView.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [paramView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
+(UIImage*)captureView:(UIView *)paramView
             viewFrame:(CGRect)viewFrame{
    CGRect rect = viewFrame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [paramView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
+(UIImage *) getImageFromUrl:(NSString *) paramUrl{
    //从网络上获取图片
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString: paramUrl]];    
    UIImage *returnImage = [UIImage imageWithData: data];
    return returnImage;
}
//将图片保存到本地
+ (void)saveImageToLocal:(UIImage*)image Keys:(NSString*)key {
    /*NSString *strPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    NSString *imageCachePath = [strPath stringByAppendingPathComponent: key];
    CLog(@"\n[saveImageToLocal]%@", imageCachePath);
    // 从网络上获取图片
    NSData *data = UIImageJPEGRepresentation(image,0.05);
    [data writeToFile: imageCachePath atomically: YES];*/
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    [preferences setObject:UIImagePNGRepresentation(image) forKey:key];
    [preferences synchronize];
}

//本地是否有相关图片
+ (BOOL)localHaveImage:(NSString*)key {
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    NSData* imageData = [preferences objectForKey:key];
    if (imageData) {
        return YES;
    }
    return NO;
}

//从本地获取图片
+ (UIImage*)getImageFromLocal:(NSString*)key {
    /*NSString *strPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    UIImage *returnImage;
    NSString *imageCachePath = [strPath stringByAppendingPathComponent: key];
    if([[NSFileManager defaultManager] fileExistsAtPath: imageCachePath]){
        returnImage= [UIImage imageWithContentsOfFile: imageCachePath];
    }
    else{
        returnImage=nil;
    }
    return returnImage;*/
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    NSData* imageData = [preferences objectForKey:key];
    UIImage* image=[[[UIImage alloc]init]autorelease];
    if (imageData) {
        image = [UIImage imageWithData:imageData];
    }
    return image;
}
@end
