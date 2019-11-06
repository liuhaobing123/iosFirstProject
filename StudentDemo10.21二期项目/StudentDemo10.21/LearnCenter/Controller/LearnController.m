//
//  LearnController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/21.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "LearnController.h"
#import "HistoryController.h"
#import "LearnTableViewList.h"
#import "ToolConstants.h"
#import "ButtonView.h"
#import "ToolConstants.h"
#import "Masonry.h"
#import "BannerViewRequest.h"

@interface LearnController ()

@property (nonatomic,retain) UIButton *rightButton;
@property (nonatomic,retain) ButtonView *btnView;
@property (nonatomic,retain) LearnTableViewList *tableViewList;

@end

@implementation LearnController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLearnNav];
    [self setElements];
    [self notifation];
    //网络回调
    [self webRequest];
}

#pragma mark -- private method

- (void) webRequest
{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        
        [[BannerViewRequest shareManager] getHolidayhw:^(id  _Nonnull Data) {
            self.tableViewList.banenr = Data;
            [self.tableViewList.learnTableView reloadData];
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    }) ;
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        
        [[BannerViewRequest shareManager] getnewmainlist:^(id  _Nonnull Data) {
            self.tableViewList.HwListArray = Data;
            [self.tableViewList.learnTableView reloadData];
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
}

- (void) notifation
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(viewAnimation:) name:@"viewAnimation" object:nil];
}

- (void) viewAnimation:(NSNotification *)notifi
{
    if([notifi.object isEqualToString:@"向上"])
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.btnView.frame = CGRectMake(SY_WIDTH, SY_HEIGHT / 2, 60, 130);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.btnView.frame = CGRectMake(SY_WIDTH - 60, SY_HEIGHT / 2, 60, 130);
        }];
    }
}

- (void) setElements
{
    self.tableViewList = [[LearnTableViewList alloc]initWithFrame:CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT - 105)];
    self.tableViewList.backgroundColor = [UIColor colorWithRed:198.0f/255.0f green:198.0f/255.0f blue:198.0f/255.0f alpha:1.0f];
    [self.view addSubview:self.tableViewList];
    self.btnView = [[ButtonView alloc] initWithFrame:CGRectMake(SY_WIDTH - 60, SY_HEIGHT / 2, 60, 130)];
    [self.view addSubview:self.btnView];
}

- (void) setLearnNav
{
    self.title = @"学习中心";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void) rightButtonClick
{
    HistoryController *historyPage = [[HistoryController alloc]init];
    historyPage.hidesBottomBarWhenPushed = YES;
    [self.context pushViewController:historyPage animated:YES];
}

#pragma mark -- lazy method

- (UIButton *)rightButton
{
    if(!_rightButton)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(0, 0, imageW, imageH);
        [_rightButton setTitle:@"历史" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, -2.5, 0, 5);
        [_rightButton setImage:[UIImage imageNamed:@"ekw_learncenter_history"] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
