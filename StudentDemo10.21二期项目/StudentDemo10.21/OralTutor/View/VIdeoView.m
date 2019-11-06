//
//  VideoView.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/29.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "VIdeoView.h"
#import "EkwPlayer/EkwPlayer.h"
#import "VideoModel.h"


#define scrollBoundWidth  self.bounds.size.width
#define scrollBoundHeight  self.bounds.size.height

@interface VideoView()
<EkwAVPlayerDelegate>

@property (nonatomic, strong) EkwAVPlayer *avPlayer;

@end

@implementation VideoView


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.avPlayer.frame = CGRectMake(0, 0, scrollBoundWidth, scrollBoundHeight);
}

- (void)drawRect:(CGRect)rect
{
    [self avPlayer];
}
#pragma mark - EkwAVPlayerDelegate

- (void)proAVPlayerPauseButtonClick:(EkwAVPlayer *)aPlayer {
    if (aPlayer.state == AVPLAYER_STATE_PLAYING)
    {
        [aPlayer pause];
    }else{
        
        [aPlayer resume];
    }
}

///*AVCoverView操作界面隐藏回调  isHidden是否隐藏 duration隐藏动画时间*/
//- (void)proAVPlayer:(EkwAVPlayer *)aPlayer coverViewHidden:(BOOL)isHidden duration:(CGFloat)duration {
//        if (self.context.topViewController == self) {
//            [UIView animateWithDuration:0.5 animations:^{
//                self.context.navigationBar.alpha = isHidden ? 0.0 : 1.0;
//            }];
//        }
//}
//
///*点击全屏按钮回调  isFull是否全屏 */
//- (void)proAVPlayer:(EkwAVPlayer *)aPlayer clickFullScreen:(BOOL)isFull {
//
//}
//
///*播放结束回调 error是否播放错误*/
//- (void)proAVPlayer:(EkwAVPlayer *)aPlayer playerError:(NSError *)error {
//
//}
//
///*Slider快进按钮开始拖拽回调  currentTime当前视频播放时间*/
//- (void)proAVPlayer:(EkwAVPlayer *)aPlayer beginDraySliderDown:(CGFloat)currentTime {
//
//}
//
///*Slider快进按钮拖拽结束回调  endTime结束时定位时间*/
//- (void)proAVPlayer:(EkwAVPlayer *)aPlayer endDraySliderUp:(CGFloat)endTime {
//
//}
//
///*视频播放同步进度回调  currentTime*/
//- (void)proAVPlayer:(EkwAVPlayer *)aPlayer traceTime:(CGFloat)currentTime {
//
//}
//
///* 拔出耳机 */
//- (void)proPullOutHeadset {
//
//}
//
///* 插入耳机 */
//- (void)proInsertHeadset {
//
//}

#pragma mark -- lazy method

- (EkwAVPlayer *)avPlayer {
    if(!_avPlayer) {
        _avPlayer = [[EkwAVPlayer alloc] initWithPlayerFrame:CGRectMake(0, 0, scrollBoundWidth, scrollBoundHeight)];
        [_avPlayer showToView:self url:self.videoParam.audio];
        _avPlayer.avDelegae = self;
        _avPlayer.enableSeek = YES;
        _avPlayer.operateView.fullHidden = NO;
    }
    return _avPlayer;
}

@end
