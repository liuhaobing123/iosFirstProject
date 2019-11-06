//
//  OutClassTable.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "OutClassTable.h"
#import "TableGesVc.h"
#import "ClassRoomCell.h"
#import "ClassRoomLetterCell.h"
#import "ACDModel.h"
#import "ToolConstants.h"

@interface OutClassTable ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) TableGesVc *tableOutClassView;
@property (nonatomic,retain) ACDModel *metaModel;

@end

@implementation OutClassTable

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableOutClassView];
}

#pragma mark - tableView Datasource & Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        ClassRoomCell *cell = [self.tableOutClassView dequeueReusableCellWithIdentifier:@"RoomCell" forIndexPath:indexPath];
        cell.headerLabel.text = @"新概念英语";
        return cell;
    }
    else
    {
        ClassRoomLetterCell *cell = [self.tableOutClassView dequeueReusableCellWithIdentifier:@"LetterCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ekw_sp_rtcbackground"]];
        cell.wordLabel.text = @"1a-1c";
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 80;
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
    UIView *vi = [[UIView alloc] init];
    return vi;
}

#pragma mark -- lazy method

- (UITableView *) tableOutClassView
{
    if (!_tableOutClassView)
    {
        _tableOutClassView = [[TableGesVc alloc]initWithFrame:CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT-60) style:UITableViewStylePlain];
        _tableOutClassView.delegate = self;
        _tableOutClassView.dataSource = self;
        _tableOutClassView.bounces = NO;
        [self.view addSubview: _tableOutClassView];
        [_tableOutClassView registerClass:[ClassRoomCell class] forCellReuseIdentifier:@"RoomCell"];
        [_tableOutClassView registerClass:[ClassRoomLetterCell class] forCellReuseIdentifier:@"LetterCell"];
    }
    return _tableOutClassView;
}

@end
