//
//  DetailWordController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/30.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "DetailWordController.h"
#import "ToolConstants.h"
#import "AFNetworking.h"

@interface DetailWordController ()
<AVAudioPlayerDelegate>

@property (nonatomic,retain) UIButton *leftButton;
@property (nonatomic,retain) UIButton *playButton;
@property (nonatomic,retain) UIView *videoView;
//音频播放
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSURL *videoUrl;
@property (nonatomic, strong) NSString *currentFilePath;

@end

@implementation DetailWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self navSetDetail];
    [self loadWebFile];
    [self videoView];
    [self playButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:NO];
    
}

#pragma mark --private method

- (void) navSetDetail
{
    self.title = @"音频播放页";
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
}

- (void) loadWebFile
{
    //保存的文件路径
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"play"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:fullPath])
    {
        //创建传话管理器
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.WordStr]];
        NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            //下载进度
            NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
            
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            
            NSLog(@"%@,%d",self.WordStr,[response.suggestedFilename isKindOfClass:[NSString class] ]);
            
            return [NSURL fileURLWithPath:fullPath];
            
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            self.videoUrl = filePath;
        }];
        [download resume];
    }
    else
    {
        self.videoUrl = [NSURL URLWithString:fullPath];
    }
}

- (void) clickBtn:(UIButton*)button
{
    NSError* error;
    
    AVAuthorizationStatus videoAuthAtatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    switch (videoAuthAtatus) {
        case AVAuthorizationStatusNotDetermined:
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
                
            }];
            break;
        case AVAuthorizationStatusRestricted:
        {
            NSLog(@"不能完成授权，可能开启了访问限制");
            break;
        }
        case AVAuthorizationStatusDenied:
        {
            NSLog(@"需要授权");
            break;
        }
        case AVAuthorizationStatusAuthorized:
        {
            //初始化
            if(self.videoUrl && videoAuthAtatus){
                self.playButton.userInteractionEnabled = NO;
                self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:self.videoUrl error:&error];
                if (error) {
                    NSLog(@"我是错误--%@--",error);
                }
                self.audioPlayer.delegate = self;
                [self.audioPlayer prepareToPlay];
                [self.audioPlayer play];
            }
            break;
        }
        default:
            break;
    }
    
}

#pragma mark --  播放音频的代理

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    //播放完成
    self.playButton.userInteractionEnabled = YES;
    NSLog(@"播放完成----");
}

#pragma mark -- private mark

- (void) leftArcButtonClick
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark -- lazy mark

- (UIButton *) leftButton
{
    if(!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 0, imageW, imageH);
        [_leftButton setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(leftArcButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIView *) videoView
{
    if(!_videoView)
    {
        _videoView = [[UIView alloc] init];
        _videoView.backgroundColor = [UIColor blueColor];
        _videoView.frame = CGRectMake(0, 30, SY_WIDTH, 100);
        [self.view addSubview:_videoView];
    }
    return _videoView;
}

- (UIButton *) playButton
{
    if(!_playButton)
    {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.layer.cornerRadius = 5;
        [_playButton setTitle:@"播放" forState:UIControlStateNormal];
        _playButton.backgroundColor = [UIColor blueColor];
        _playButton.frame = CGRectMake(SY_WIDTH/2 - 40, 350, 80, 44);
        [self.view addSubview:_playButton];
        [_playButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

@end
