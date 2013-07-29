//
//  MusicPlayManage.h
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-24.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@class MusicInfo;
@class MusicIterator;

typedef enum {
    MODE_NO =0,
    MODE_ONE,
    MODE_ALL
}cirMode;

@interface MusicPlayManage : NSObject<AVAudioPlayerDelegate>

@property (nonatomic,assign) int cirMode;
@property (nonatomic,retain) NSString *strMusicName;
@property (nonatomic,retain) MusicIterator *musicIter;

-(void)initData:(NSMutableArray *)arr;
-(BOOL)isPlaying;
-(BOOL)playMusic:(NSString *)musicName
        musicUrl:(NSString *)musicUrl;
-(BOOL)stopMusic;
-(BOOL)nextMusic;
-(BOOL)previousMusic;
-(NSString *)getCurrMusicName;
-(void)setCirMode:(int)cirMode;

@end
//音乐信息
@interface MusicInfo : NSObject
@property (nonatomic,retain) NSString *strMusicName;
@property (nonatomic,retain) NSString *strMusicUrl;
@end
//播放器迭代器
@interface MusicIterator : NSObject
-(id)createIterator:(NSMutableArray *)arr;
-(BOOL)hasNext;
-(id)next;
-(BOOL)hasPrevious;
-(id)previous;
@end