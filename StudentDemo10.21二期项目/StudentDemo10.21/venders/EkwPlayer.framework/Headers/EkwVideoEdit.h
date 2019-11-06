//
//  EkwVideoEdit.h
//  EkwPlayer
//
//  Created by chen on 2017/10/26.
//  Copyright © 2017年 chen. All rights reserved.
//  音频、视频编辑

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AVAudioHeader.h"

@class MediaModel;


@interface EkwVideoEdit : NSObject

/**
 *  音频合成
 *  @param audioArray 合成音频单元数组
 *  @param outPath    合成后输出路径目录，路径目录以.m4a文件结尾
 *  @param block      完成执行块
 *  return
 */
+ (void)MixAudioWithArray:(NSArray<MediaModel*> *)audioArray
                  outPath:(NSString *)outPath
               completion:(AVMixCompletionBlock) block;


/**
 *  视频合成，使用格式为  mp4/mp3
 *  @param audioArray 合成音频单元数组
 *  @param outPath    合成后输出路径目录，路径目录以.mp4文件结尾
 *  @param video      本地视频文件路径，视频格式必须为mp4
 *  @param background 需要合成的背景音路径，格式必须为mp3
 *  @param block      完成执行块
 *  return
 */
+ (void)MixVideoWithArray:(NSArray<MediaModel*> *)audioArray
                  outPath:(NSString *)outPath
                videoPath:(NSString *)video
           backgroundPath:(NSString *)background
               completion:(AVMixCompletionBlock) block;


/**
 *  音频合成 不包含视频画面的所有音频的集合（视频的背景音，非用户对话的原音部分, 用户对话), 使用格式为 m4a
 *  @param audioArray 合成音频单元数组
 *  @param outPath    合成后输出路径目录，路径目录以.m4a文件结尾
 *  @param video      本地视频文件路径，视频格式必须为mp4
 *  @param background 需要合成的背景音路径，格式必须为mp3
 *  @param block      完成执行块
 *  return
 */
+ (void)MixAudioWithArray:(NSArray<MediaModel*> *)audioArray
                  outPath:(NSString *)outPath
                videoPath:(NSString *)video
           backgroundPath:(NSString *)background
               completion:(AVMixCompletionBlock) block;

@end




@interface MediaModel : NSObject
/*开始定位时间  毫秒*/
@property (nonatomic, assign) float startTime;
/*播放持续时间*/
@property (nonatomic, assign) float duration;
/*用户录音路径，必须是.mp3*/
@property (nonatomic, strong) NSString *audioPath;
/*音频录音*/
@property (nonatomic, strong) NSString *cellId;

@end

