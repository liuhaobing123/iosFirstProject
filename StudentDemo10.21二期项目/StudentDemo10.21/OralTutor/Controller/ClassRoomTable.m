//
//  ClassRoomTable.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "ClassRoomTable.h"
#import "TableGesVc.h"
#import "ACDModel.h"
#import "DataListRequest.h"
#import "ClassRoomCell.h"
#import "ClassRoomWordCell.h"
#import "ToolConstants.h"
#import "ClassRoomLetterCell.h"
#import "OralTabHeaderView.h"
#import "videoPlayTabCell.h"
#import "VideoModel.h"

@interface ClassRoomTable ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) TableGesVc *tableRoomView;
@property (nonatomic,retain) OralTabHeaderView *headerView;
@property (nonatomic,retain) ACDModel *metaModel;
@property (nonatomic,retain) VideoModel *videoModel;

@property (nonatomic,assign) BOOL isNav;
@property (nonatomic,assign) BOOL isLoad;

@end

@implementation ClassRoomTable

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableRoomView];
    [self getWebData];
}

#pragma mark - tableView Datasource & Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        ClassRoomCell *cell = [self.tableRoomView dequeueReusableCellWithIdentifier:@"RoomCell" forIndexPath:indexPath];
        cell.headerLabel.text = self.metaModel ? [NSString stringWithFormat:@"%@-%@-%@",self.metaModel.book_chosen.book_name,self.metaModel.book_chosen.book_subname,self.metaModel.book_chosen.book_id]: @"";
        return cell;
    }
    if(indexPath.section == 1)
    {
        ClassRoomWordCell *cell = [self.tableRoomView dequeueReusableCellWithIdentifier:@"WordCell" forIndexPath:indexPath];
        if(_isLoad)
        {
            cell.returnWebString = ^{
                [self loadWebFile];
            };
            _isLoad = NO;
        }
        cell.wordLeftLabel.text = @"1a-1c";
        cell.wordRightLabel.text = @"1a-1c";
        
        return cell;
    }
    if(indexPath.section == 2)
    {
        ClassRoomLetterCell *cell = [self.tableRoomView dequeueReusableCellWithIdentifier:@"LetterCell" forIndexPath:indexPath];
        cell.wordLabel.text = @"1a-1c";
        
        return cell;
    }
    else{
        videoPlayTabCell *cell = [self.tableRoomView dequeueReusableCellWithIdentifier:@"PlayTabCell" forIndexPath:indexPath];
        if(_isNav)
        {
            cell.returnString =  ^{
                [self postMessage];
            };
            _isNav = NO;
        }
        cell.leftImagePlayView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.videoModel.video_img]]];
        cell.rightImagePlayView.backgroundColor = [UIColor redColor];
        cell.leftNameLabel.text = @"上课时间到啦！";
        cell.rightNameLabel.text = @"456";
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 80;
    }
    if(indexPath.section == 1)
    {
        return 120;
    }
    else
    {
        return 150;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return nil;
    }
    else
    {
        self.headerView = [[OralTabHeaderView alloc] initWithFrame:CGRectMake(0, 0, SY_WIDTH, 30)];
        if(section == 1)
        {
            self.headerView.headerLaber.text = @"读单词";
            [self.headerView.headerButton setTitle:@"学习进度0/2" forState:UIControlStateNormal];
        }
        else if(section == 2)
        {
            self.headerView.headerLaber.text = @"读课文";
            [self.headerView.headerButton setTitle:@"学习进度0/2" forState:UIControlStateNormal];
        }
        else if(section == 3)
        {
            self.headerView.headerLaber.text = @"趣味配音";
            [self.headerView.headerButton setTitle:@"查看更多" forState:UIControlStateNormal];
        }
        return self.headerView;
    }
}

#pragma mark -- private method

- (void) getHomeOutData:(NSNotification *)nofi
{
    self.metaModel = nofi.object;
    [self.tableRoomView reloadData];
}

- (void) getCurrentData:(NSNotification *)nofi
{
    self.videoModel = nofi.object;
    [self.tableRoomView reloadData];
}

- (void) getWebData
{
    _isNav = YES;
    _isLoad = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getHomeOutData:) name:@"SpeakHomeOutside" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCurrentData:) name:@"getCurrent" object:nil];
}

- (void) loadWebFile
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"detailWordController" object:@"http://cdn-resource.ekwing.com/acpf/data/upload/tk/2015/08/19/55d3df53c4fdf.mp3"];
}

- (void) postMessage
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"detailController" object:self.videoModel];
}

#pragma mark -- lazy method

- (UITableView *) tableRoomView
{
    if (!_tableRoomView)
    {
        _tableRoomView = [[TableGesVc alloc] initWithFrame:CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT-20) style:UITableViewStyleGrouped];
        _tableRoomView.delegate = self;
        _tableRoomView.dataSource = self;
        _tableRoomView.bounces = NO;
        [self.view addSubview: _tableRoomView];
        _tableRoomView.separatorStyle = UITableViewCellStyleDefault;
        [_tableRoomView registerClass:[ClassRoomCell class] forCellReuseIdentifier:@"RoomCell"];
        [_tableRoomView registerClass:[ClassRoomWordCell class] forCellReuseIdentifier:@"WordCell"];
        [_tableRoomView registerClass:[ClassRoomLetterCell class] forCellReuseIdentifier:@"LetterCell"];
        [_tableRoomView registerClass:[videoPlayTabCell class] forCellReuseIdentifier:@"PlayTabCell"];
    }
    return _tableRoomView;
}

@end
