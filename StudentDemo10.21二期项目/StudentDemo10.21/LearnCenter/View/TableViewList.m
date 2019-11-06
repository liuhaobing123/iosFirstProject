//
//  TableViewList.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "UIScrollList.h"
#import "ToolConstants.h"

@interface UIScrollList()
<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) UITableView *tableViewList;

@end

@implementation UIScrollList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self tableViewList];
    }
    return self;
}

- (void)layoutSubviews
{
    self.tableViewList.frame = CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT);
}

#pragma mark -- UItableView delegate and datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableViewList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"123";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

#pragma mark -- lazy method

- (UITableView *) tableViewList
{
    if (!_tableViewList)
    {
        self.tableViewList = [[UITableView alloc]init];
        self.tableViewList.delegate = self;
        self.tableViewList.dataSource = self;
        [self addSubview: self.tableViewList];
        [self.tableViewList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableViewList;
}

@end
