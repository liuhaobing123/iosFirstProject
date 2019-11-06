//
//  UITableList.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "UITableList.h"
#import "ToolConstants.h"
#import "Masonry.h"

@interface UITableList()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) UITableView *tableViewList;

@end

@implementation UITableList

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor blueColor];
    [super viewDidLoad];
    [self tableViewList];
}

#pragma mark -- UITableView delegate and datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableViewList dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;    
    cell.textLabel.text = @"123";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 35;
}

#pragma mark -- lazy method

- (UITableView *) tableViewList
{
    if (!_tableViewList)
    {
        _tableViewList = [[UITableView alloc]init];
        _tableViewList.delegate = self;
        _tableViewList.dataSource = self;
        [self.view addSubview: _tableViewList];
        _tableViewList.frame = self.view.bounds;
        [_tableViewList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    }
    return _tableViewList;
}


@end
