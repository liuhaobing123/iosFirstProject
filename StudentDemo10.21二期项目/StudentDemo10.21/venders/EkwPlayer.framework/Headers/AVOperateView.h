//
//  AVOperateView.h
//  EKWApplication
//
//  Created by 陈佳俊 on 16/9/12.
//  Copyright © 2016年 chen. All rights reserved.
//  avPlayer操作view

#import <UIKit/UIKit.h>

@protocol AVOperateViewDelegate;

@interface AVOperateView : UIView

/* 拖动slider
 */
@property (nonatomic, strong) UISlider *sliderView;
/* 设置全屏半屏
 */
@property (nonatomic, assign) BOOL fullHidden;
/* player是否正在全屏
 */
@property (nonatomic, assign, readonly) BOOL isFullScreen;
/* 设置是否可以滑动快进
 */
@property (nonatomic, assign) BOOL enableSeek;

/* 代理
 */
@property (nonatomic, weak) id<AVOperateViewDelegate> delegate;

/* 外部设置slider拖动进度跟踪事件
 * @param current  当前时间
 * @param total    进度总时间
 * return
 */
- (void)trackCurrentTime:(CGFloat)current total:(CGFloat)total;

/* 外部调用，设置是否全屏显示
 * @param isFull控制是否全屏
 * @param animation全屏过程是否有动画
 * return
 */
- (void)fullViewToScreen:(BOOL)isFull withAnimation:(BOOL)animation;

@end


@protocol AVOperateViewDelegate <NSObject>

/* 点击全屏、半屏显示代理回调 */
- (void)proFullScreenEvent:(BOOL) isFull animation:(BOOL) animation;

@optional

/* 开始拖拽回调 */
- (void)proBeginDraySliderDown:(CGFloat) beginTime;
/* 拖拽滑动回调 */
- (void)proDraySliderChange:(CGFloat) changeTime;
/* 拖拽结束回调 */
- (void)proEndDraySliderUp:(CGFloat) seekTime;

@end
