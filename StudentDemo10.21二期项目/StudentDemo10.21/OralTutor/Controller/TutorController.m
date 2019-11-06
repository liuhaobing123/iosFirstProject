//
//  TutorController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/21.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "TutorController.h"
#import "UIScrollViewList.h"
#import "ToolConstants.h"
#import "H5ViewController.h"
#import "DataListRequest.h"
#import "DetailVideoController.h"
#import "DetailWordController.h"

@interface TutorController ()

@property (nonatomic,retain) UIScrollViewList *scrollView;

@end

@implementation TutorController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setElements];
    [self webRequest];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:YES];
}

#pragma mark -- private method

- (void) webRequest
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        [[DataListRequest shareManager] getSpeakHomeOutsideData:^(id  _Nonnull Data) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SpeakHomeOutside" object:Data];
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    }) ;
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        [[DataListRequest shareManager] getCurrentData:^(id  _Nonnull Data) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getCurrent" object:Data];
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    }) ;
}

- (void) pushH5View
{
    [[DataListRequest shareManager] getHtmlRequestData:^(id  _Nonnull Data) {
    H5ViewController *h5View = [[H5ViewController alloc] init];
    h5View.hidesBottomBarWhenPushed = YES;
    h5View.h5Str =  [NSString stringWithFormat:@"%@?v=%@",Data, @"1.9"];
    [self.navigationController pushViewController:h5View animated:YES];
    }];
}

- (void) pushDetailController:(NSNotification *)noti
{
    DetailVideoController *pushVideo = [[DetailVideoController alloc] init];
    pushVideo.videoParam = [noti object];
    pushVideo.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pushVideo animated:NO];
}

- (void) pushWordDetailcontroller:(NSNotification *)noti
{
    DetailWordController *pushWord = [[DetailWordController alloc] init];
    pushWord.WordStr = [noti object];
    pushWord.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pushWord animated:NO];
}

//设置状态栏背景颜色
- (void) setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void) setElements
{
    self.scrollView = [[UIScrollViewList alloc] initWithFrame:CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT)];
    [self.view addSubview:self.scrollView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushH5View) name:@"pushView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushDetailController:) name:@"detailController" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushWordDetailcontroller:) name:@"detailWordController" object:nil];
}

@end
