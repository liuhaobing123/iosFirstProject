//
//  DetailVideoController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/29.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "DetailVideoController.h"
#import "ToolConstants.h"
#import "VIdeoView.h"
#import "VideoModel.h"

@interface DetailVideoController ()

@property (nonatomic,retain) UIButton *leftButton;
@property (nonatomic,retain) VideoView *videoHeaderView;

@end

@implementation DetailVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self navSetDetail];
    self.videoHeaderView = [[VideoView alloc] init];
    self.videoHeaderView.videoParam = self.videoParam;
    self.videoHeaderView.frame = CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT /3);
    [self.view addSubview:self.videoHeaderView];
}

#pragma mark --private method

- (void) navSetDetail
{
    [self.navigationController.navigationBar setHidden:NO];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"视频播放页";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

#pragma mark -- private mark

- (void) leftArcButtonClick
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark -- lazy mark

- (UIButton *)leftButton
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

@end
