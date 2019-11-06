//
//  EkwAudioPlayer.h
//
//
//  Created by chen on 14-7-15.
//  Copyright (c) 2014年 ekwing. All rights reserved.
//  播放在线和本地音频

#import <Foundation/Foundation.h>
#import "AVAudioHeader.h"

@interface EkwAudioPlayer : NSObject

+(instancetype)shared;

/* 是否在播放状态
 */
@property (nonatomic, assign) BOOL isPlaying;

/**
 当前URL
 */
@property (nonatomic, strong, readonly, nullable) NSURL *currentURL;

/**
 总时长
 */
@property (nonatomic, assign, readonly) double duration;

/**
 进度
 */
@property (nonatomic, assign, readonly) double progress;


/**
 range:0 ~ 1 , default: 1
 */
@property (nonatomic, assign) Float32 volume;

/**
 *  播放本地音频
 *  @param  filePath 音频路径
 *  @param isRecording 是否正在录音，
    为YES使用AVAudioSessionCategoryPlayAndRecord,
    否则用AVAudioSessionCategorySoloAmbient，下同
 *  @param  block 回调块
 *  return
 */
- (void)playLocalPath:(NSString *)filePath
            recording:(BOOL)isRecording
                block:(AVProgressBlock)block;

/**
 *  播放本地音频
 *  @param  filePath 音频路径
 *  @param  start 音频开始播放位置
 *  @param  time  音频播放持续时间
 *  @param  block 回调块
 *  return
 */
- (void)playLocalPath:(NSString *)filePath
            recording:(BOOL)isRecording
                start:(float)start
                 time:(float)time
                block:(AVProgressBlock)block;

/**
 *  播放本地音频
 *  @param  filePath 音频路径
 *  @param  delay 延迟时间
 *  @param  start 音频开始播放位置
 *  @param  time  音频播放持续时间
 *  @param  block 回调块
 *  return
 */
- (void)playLocalPath:(NSString *)filePath
            recording:(BOOL)isRecording
                delay:(float)delay
                start:(float)start
                 time:(float)time
                block:(AVProgressBlock)block;

/**
 *  播放在线音频
 *  @param  url 音频地址
 *  @param  block 回调块
 *  return
 */
- (void)playOnlineUrl:(NSString *)url
            recording:(BOOL)isRecording
                block:(AVProgressBlock)block;

/**
 *  播放在线音频
 *  @param  url 音频地址
 *  @param  start 音频开始播放位置
 *  @param  time  音频播放持续时间
 *  @param  block 回调块
 *  return
 */
- (void) playOnlineUrl:(NSString *)url
             recording:(BOOL)isRecording
                 start:(float)start
                  time:(float)time
               timeOut:(float)timeOut
                 block:(AVProgressBlock)block;

/**
 *  播放在线音频
 *  @param  url 音频地址
 *  @param  delay 延迟时间
 *  @param  start 音频开始播放位置
 *  @param  time  音频播放持续时间
 *  @param  timeOut  如果没数据返回，超时时间
 *  @param  block 回调块
 *  return
 */
- (void)playOnlineUrl:(NSString *)url
            recording:(BOOL)isRecording
                delay:(float)delay
                start:(float)start
                 time:(float)time
              timeOut:(float)timeOut
                block:(AVProgressBlock)block;


/**
 资源配置

 @param url url description
 @param isRecording isRecording description
 @param isOnline isOnline description
 @param start start description
 @param time time description
 @param timeOut timeOut description
 @param block block description
 */
- (void) setURL:(NSString *)url
      recording:(BOOL)isRecording
         onLine:(BOOL)isOnline
          start:(float)start
           time:(float)time
        timeOut:(float)timeOut
          block:(AVProgressBlock)block;

/**
 播放
 */
- (void)play;

/**
 *  快进到某个时间
 *  @param  startTime 快进定位的时间点
 *  return
 */
- (void)seekToTime:(float)startTime;

/**
 *  设置播放声音大小
 *  @param  volume 声音范围 0-1.0
 *  return
 */
- (void)changeVolumeToValue:(float)volume;

/**
 *  暂停播放
 *  return
 */
-(void)pause;

/**
 *  恢复播放
 *  return
 */
-(void)resume;

/**
 *  停止播放
 *  return
 */
-(void)stop;

@end
