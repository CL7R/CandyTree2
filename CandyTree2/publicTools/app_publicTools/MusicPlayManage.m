//
//  MusicPlayManage.m
//  CandyTree2
//
//  Created by CL7RNEC on 13-5-24.
//  Copyright (c) 2013年 CL7RNEC. All rights reserved.
//

#import "MusicPlayManage.h"

@interface MusicPlayManage ()

@property (nonatomic,retain) AVAudioPlayer *audio;

@end

@implementation MusicPlayManage

-(void)dealloc{
    [_strMusicName release];
    [_musicIter release];
    [super dealloc];
}
-(void)initData:(NSMutableArray *)arr{
    _musicIter=[[MusicIterator alloc]createIterator:arr];
}
-(BOOL)isPlaying{
    return [_audio isPlaying];
}
-(BOOL)playMusic:(NSString *)musicName
        musicUrl:(NSString *)musicUrl{
    _strMusicName=musicName;
    NSString *str=[NSString stringWithFormat:@"%@",musicUrl];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:str];
    _audio = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    _audio.delegate=(id)self;
	[_audio prepareToPlay];
    return [_audio play];
}
-(BOOL)stopMusic{
    if ([_audio isPlaying]) {
        [_audio stop];
    }
    return YES;
}
-(BOOL)nextMusic{
    if ([_audio isPlaying]) {
        [_audio stop];
    }
    if ([_musicIter hasNext]) {
        MusicInfo *info=[_musicIter next];
        return [self playMusic:info.strMusicName musicUrl:info.strMusicUrl];
    }
    else{
        return NO;
    }
}
-(BOOL)previousMusic{
    if ([_audio isPlaying]) {
        [_audio stop];
    }
    if ([_musicIter hasPrevious]) {
        MusicInfo *info=[_musicIter previous];
        return [self playMusic:info.strMusicName musicUrl:info.strMusicUrl];
    }
    else{
        return NO;
    }
}
-(NSString *)getCurrMusicName{
    return _strMusicName;
}
-(void)setCirMode:(int)cirMode{
    _cirMode=cirMode;
    switch (_cirMode) {
        case MODE_NO:
            _audio.numberOfLoops=1;
            break;
        case MODE_ONE:
            _audio.numberOfLoops=-1;
            break;
        case MODE_ALL:
            
            break;
        default:
            break;
    }
}
#pragma mark - AvAudioDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    CLog(@"\n[audioPlayerDidFinishPlayingDelegate]%d",flag);
    //播放完毕
    switch (_cirMode) {
        case MODE_NO:
            
            break;
        case MODE_ONE:
            
            break;
        case MODE_ALL:
            [self nextMusic];
            break;
        default:
            break;
    }
}
@end
//音乐信息
@implementation MusicInfo

@end
//播放器迭代器
@interface MusicIterator ()
@property (nonatomic,assign) int indexFlag;
@property (nonatomic,retain) NSMutableArray *arrMusicName;
@end

@implementation MusicIterator
-(void)dealloc{
    [_arrMusicName release];
    [super dealloc];
}
-(id)createIterator:(NSMutableArray *)arr{
    if(self = [super init])
    {
        _arrMusicName=arr;
        [_arrMusicName retain];
    }
    return self;
}
-(BOOL)hasNext{
    if (_indexFlag>=[_arrMusicName count]||[_arrMusicName objectAtIndex:_indexFlag]==nil) {
        return NO;
    }
    else{
        return YES;
    }
}
-(id)next{
    return [_arrMusicName objectAtIndex:_indexFlag++];
}
-(BOOL)hasPrevious{
    if (_indexFlag<=0||[_arrMusicName objectAtIndex:_indexFlag]==nil) {
        return NO;
    }
    else{
        return YES;
    }
}
-(id)previous{
    return [_arrMusicName objectAtIndex:_indexFlag--];
}
@end