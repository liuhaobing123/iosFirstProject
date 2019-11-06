//
//  EkwAVPlayer.h
//  EKWApplication
//
//  Created by 陈佳俊 on 16/9/12.
//  Copyright © 2016年 chen. All rights reserved.
//  视频播放vc

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "AVAudioHeader.h"

@class AVPlayerTool;
@class AVCoverView;
@class AVOperateView;
@protocol EkwAVPlayerDelegate;

@interface EkwAVPlayer : UIView

/*播放状态
 */
@property (nonatomic, assign, readonly) AVPLAYER_STATE state;
/*视频总时间
 */
@property (nonatomic, assign, readonly) CGFloat duration;
/*播放视频当前进度
 */
@property (nonatomic, assign, readonly) CGFloat current;
/**/
@property (nonatomic, strong, readonly) AVPlayer *avPlayer;
/*底部操作面板
 */
@property (nonatomic, strong, readonly) AVOperateView *operateView;
/*上层操作面板，可外部扩展
 */
@property (nonatomic, strong) AVCoverView *coverView;
/*player的父亲view
 */
@property (nonatomic, weak) UIView *superView;
/*视频边播放边下载，本地存储的视频下载路径，暂时不用
 */
@property (nonatomic, strong) NSString *foldPath;
/*播放地址，在线或者本地
 */
@property (nonatomic, strong) NSString *playUrl;
/*设置声音
 */
@property (nonatomic, assign) CGFloat volume;
/*是否可以快进
 */
@property (nonatomic, assign) BOOL enableSeek;
/*是否显示暂停按钮
 */
@property (nonatomic, assign) BOOL isShowPause;
/*是否可以暂停(手动点击暂停按钮触发)
 */
@property (nonatomic, assign) BOOL enablePause;
/**/
@property (nonatomic, weak) id<EkwAVPlayerDelegate> avDelegae;
//屏幕拉伸
@property(nonatomic, copy) AVLayerVideoGravity videoGravity;

/*
 */
- (instancetype)initWithPlayerFrame:(CGRect)frame;

/**
 *  重新设置avPlayer播放器的frame，设置后其他view会自动去适配
 *  @param frame 新player的frame
 *  return
 */
- (void)resetFrame:(CGRect)frame;

/**
 *  把player添加到view上，可以设置默认显示图片
 *  @param view 添加palyer到view上
 *  @param image 本地占位图片
 *  return
 */
- (void)showToView:(UIView *)view placeImage:(UIImage *)image;

/**
 *  把player添加到view上，可以设置默认显示图片
 *  @param view 添加palyer到view上
 *  @param imageUrl 在线占位图片
 *  return
 */
- (void)showToView:(UIView *)view placeImageWithUrl:(NSString *)imageUrl;


/**
 *  把player添加到view上，不播放。前提是playUrl已经设置过地址
 *  @param view 添加palyer到view上
 *  return
 */
- (void)showToView:(UIView *)view;

/**
 *  把player添加到view上，不播放。给player播放地址
 *  @param view 添加palyer到view上
 *  @param url  player需要播放的地址
 *  return
 */
- (void)showToView:(UIView *)view url:(NSString *)url;

/**
 *  把player添加到view上，不播放。给player播放路径
 *  @param view  添加palyer到view上
 *  @param path  player需要播放的本地路径
 *  return
 */
- (void)showToView:(UIView *)view path:(NSString *)path;

/**
 *  播放视频
 *  @param url  播放在线地址
 *  return
 */
- (void)playWithUrl:(NSString *)url;

/**
 *  播放视频
 *  @param path 播放本地路径
 *  return
 */
- (void)playWithPath:(NSString *)path;

/**
 *  播放视频
 *  @param url   在线地址
 *  @param view  添加到的父view
 *  return
 */
- (void)playWithUrl:(NSString *)url showView:(UIView *)view;

/**
 *  播放视频
 *  @param path  本地路径
 *  @param view  添加到的父view
 *  return
 */
- (void)playWithPath:(NSString *)path showView:(UIView *)view;

/**
 *  重新给player赋播放url/path，如果之前视频正在播放，赋值后播放状态跟之前的一样
 *  @param sourceURL  播放资源路径
 *  @param isOnline   是否是在线的
 *  return
 */
- (void)resetSourceURL:(NSString *)sourceURL onLine:(BOOL)isOnline;

/**
 *  视频定位
 *  @param startTime  视频定位时间
 *  return
 */
- (void)seekToTime:(CGFloat)startTime;

/**
 *  视频定位
 *  @param startTime  视频定位时间
 *  @param time       定位后播放持续时间
 *  return
 */
- (void)seekToTime:(CGFloat)startTime lastTime:(CGFloat)time;

/**
 *  播放定位
 *  @param startTime      播放定位时间
 *  @param time           播放持续时间
 *  @param progressBlock  播放同步执行的block
 *  return
 */
- (void)seekToTime:(CGFloat)startTime lastTime:(CGFloat)time progress:(AVProgressBlock) progressBlock;

/**
 * 开始播放
 * return
 */
- (void)resume;

/**
 * 暂停
 * return
 */
- (void)pause;

/**
 * 调用显示全屏，目前全屏只是在window上旋转放大/缩小
 * @param  animation 是否有全屏动画
 * return
 */
- (void)fullScreenAnimation:(BOOL)animation;

/**
 * 调用显示非全屏，目前全屏只是在window上旋转放大/缩小
 * @param  animation 是否有全屏动画
 * return
 */
- (void)halfScreenAnimation:(BOOL)animation;

@end


@protocol EkwAVPlayerDelegate <NSObject>

@optional

/*点击开始按钮回调 */
- (void)proAVPlayerPauseButtonClick:(EkwAVPlayer *)aPlayer;

/*点击全屏按钮回调  isFull是否全屏 */
- (void)proAVPlayer:(EkwAVPlayer *)aPlayer clickFullScreen:(BOOL)isFull;

/*播放结束回调 error是否播放错误*/
- (void)proAVPlayer:(EkwAVPlayer *)aPlayer playerError:(NSError *)error;

/*AVCoverView操作界面隐藏回调  isHidden是否隐藏 duration隐藏动画时间*/
- (void)proAVPlayer:(EkwAVPlayer *)aPlayer coverViewHidden:(BOOL)isHidden duration:(CGFloat)duration;

/*Slider快进按钮开始拖拽回调  currentTime当前视频播放时间*/
- (void)proAVPlayer:(EkwAVPlayer *)aPlayer beginDraySliderDown:(CGFloat)currentTime;

/*Slider快进按钮拖拽结束回调  endTime结束时定位时间*/
- (void)proAVPlayer:(EkwAVPlayer *)aPlayer endDraySliderUp:(CGFloat)endTime;

/*视频播放同步进度回调  currentTime*/
- (void)proAVPlayer:(EkwAVPlayer *)aPlayer traceTime:(CGFloat)currentTime;

/* 拔出耳机 */
- (void)proPullOutHeadset;

/* 插入耳机 */
- (void)proInsertHeadset;
@end


