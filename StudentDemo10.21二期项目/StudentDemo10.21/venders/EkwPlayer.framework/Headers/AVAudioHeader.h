//
//  AVAudioHeader.h
//  EKWApplication
//
//  Created by 陈佳俊 on 2016/10/13.
//  Copyright © 2016年 chen. All rights reserved.
//

#ifndef AVAudioHeader_h
#define AVAudioHeader_h

typedef NS_ENUM(NSUInteger, AVPLAYER_STATE) {
    AVPLAYER_STATE_BUFFER,    //正在缓冲
    AVPLAYER_STATE_PLAYING,   //正在播放
    AVPLAYER_STATE_PAUSE,     //正在暂停
    AVPLAYER_STATE_FINISH,    //播放完成
    AVPLAYER_STATE_ERROR      //播放错误
};

static NSString *const EkwAVPlayerItemStatusKeyPath = @"status";
static NSString *const EkwAVPlayerItemLoadedTimeRangesKeyPath = @"loadedTimeRanges";
static NSString *const EkwAVPlayerItemBufferEmptyKeyPath = @"playbackBufferEmpty";
static NSString *const EkwAVPlayerItemBufferFullKeyPath = @"playbackBufferFull";

/** 开始播放时，通知key，外部调用提示音量
 */
static NSString *const EkwAVplayerBeginPlayAudioKey = @"EkwAVplayerBeginPlayAudio";
static NSString *const EkwAVplayerBeginPlayVideoKey = @"EkwAVplayerBeginPlayVideo";


/*
 */
typedef void (^AVProgressBlock)(float currTime, float duration, NSError *error, BOOL finished, id object);

/*
 */
typedef void (^AVMixCompletionBlock)(BOOL success, NSString *path, float MediaDuration, float mixDuration);



#endif /* AVAudioHeader_h */
