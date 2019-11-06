//
//  LearnTableViewList.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "LearnTableViewList.h"
#import "ToolConstants.h"
#import "TableImageCell.h"
#import "TableWebCell.h"
#import "TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ToolConstants.h"
#import "BannerModel.h"
#import "EKWHwMainListModel.h"
#import "LearnTableListHeader.h"

#define scrollBoundWidth  self.bounds.size.width
#define scrollBoundHeight  self.bounds.size.height

@interface LearnTableViewList()
<UITableViewDelegate,UITableViewDataSource>

@property (assign,nonatomic) float lastContentOffset;
@property (nonatomic,retain) LearnTableListHeader *headerView;
@property (nonatomic,retain) EKWHwMainListModel *HwList;

@end

@implementation LearnTableViewList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self learnTableView];
    }
    return self;
}

//因为会调用get方法
- (void)layoutSubviews
{
    
}

#pragma mark -- UIScrollView delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.lastContentOffset = scrollView.contentOffset.y;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if(self.lastContentOffset < scrollView.contentOffset.y)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"viewAnimation" object:@"向上"];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"viewAnimation" object:@"向下"];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y > 260)
    {
        self.headerView.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        self.headerView.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark -- UITableView delegate and datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        TableImageCell *cell = [self.learnTableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 1)
    {
        TableWebCell *cell = [self.learnTableView dequeueReusableCellWithIdentifier:@"WebCell" forIndexPath:indexPath];
        [cell.banderImageView sd_setImageWithURL:[NSURL URLWithString:self.banenr.vacationImage] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
        cell.strLine1 = self.banenr.vacationTitle;
        cell.strLine2 = self.banenr.vacationDescribe;

        return cell;
    }
    else
    {
        self.HwList = self.HwListArray[indexPath.row];
        TableViewCell *cell = [self.learnTableView dequeueReusableCellWithIdentifier:@"ViewCell" forIndexPath:indexPath];
        if ([self.HwList.type isEqualToString:@"hw"]) {
          cell.imageType = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ekw_learncenter_homework"]];
        }else if ([self.HwList.type isEqualToString:@"train"]) {
          cell.imageType = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ekw_learncenter_train"]];
        }else if ([self.HwList.type isEqualToString:@"exam"]) {
          cell.imageType = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ekw_learncenter_exam"]];
        }
        cell.titleLabel.text = self.HwList.title;
        cell.timeLabel.text = [NSString stringWithFormat:@"剩余时间：%@",self.HwList.left_time];
        cell.progressLabel.text = [NSString stringWithFormat:@"%@/%@",self.HwList.finish_num,self.HwList.total_num];
        [cell.progressView setProgress:[self.HwList.finish_num intValue]/[self.HwList.total_num intValue]];
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 2)
    {
        return self.HwListArray.count;
    }
    else
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 130;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return _table_section_height;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.headerView = [[LearnTableListHeader alloc] initWithFrame: CGRectMake(0, 0, SY_WIDTH, 30)];
    self.headerView.headerLaber.text = [NSString stringWithFormat:@"待完成（共%lu份）",(unsigned long)self.HwListArray.count];
    
    return self.headerView;
}


#pragma mark -- lazy method

- (UITableView *) learnTableView
{
    if(!_learnTableView)
    {
    _learnTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scrollBoundWidth, scrollBoundHeight) style:UITableViewStylePlain];
    _learnTableView.delegate = self;
    _learnTableView.dataSource = self;
    [self addSubview: _learnTableView];
    
    _learnTableView.scrollEnabled = YES;
    _learnTableView.bounces = NO;

    _learnTableView.backgroundColor = [UIColor colorWithRed:198.0f/255.0f green:198.0f/255.0f blue:198.0f/255.0f alpha:1.0f];
    _learnTableView.separatorStyle = UITableViewCellStyleDefault;
    [_learnTableView registerClass:[TableImageCell class] forCellReuseIdentifier:@"ImageCell"];
    [_learnTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"ViewCell"];
    [_learnTableView registerClass:[TableWebCell class] forCellReuseIdentifier:@"WebCell"];
    }
    
    return _learnTableView;
}

@end
