//
//  AVCoverView.h
//  EKWApplication
//
//  Created by 陈佳俊 on 16/9/12.
//  Copyright © 2016年 chen. All rights reserved.
//  avPlayer 浮层cover

#import <UIKit/UIKit.h>

@protocol AVCoverViewDelegate;

typedef enum : NSUInteger {
    TipShowTypePlay,
    TipShowTypePause,
    TipShowTypeSuccess,
    TipShowTypeFaild,
} TipShowType;

@interface AVCoverView : UIView

/*  暂停、播放Button
 */
@property (nonatomic, strong) UIButton *playButton;

/*  显示标题信息
 */
@property (nonatomic, strong) NSString *title;

/*  代理
 */
@property (nonatomic, weak) id<AVCoverViewDelegate> delegate;


/* 设置playButton显示状态
 * @param TipShowType 按钮显示状态
 * return
 */
- (void)resetPlayButtonImage:(TipShowType) showType;

/* 外部调用点击播放按钮
 * return
 */
- (void)autoClickPlayButton;

/*
 * 开始下载
 */
- (void)showStartDownloadTip:(NSString *) tip;

/*
 * 下载进度
 */
- (void)showRefreshProgress:(CGFloat) progress;

/*
 * 下载成功显示
 */
- (void)showDownLoadSuccessTip:(void(^)(void))finishBlock;

/*
 * 下载失败显示
 */
- (void)showDownLoadFailedTip:(void(^)(void))finishBlock;

@end


@protocol AVCoverViewDelegate <NSObject>

/* 点击播放按钮回调代理 */
- (void)proClickPlayButton:(UIButton *) button;

@end

