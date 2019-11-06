//
//  ClassRoomWordCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/27.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "ClassRoomWordCell.h"
#import "ToolConstants.h"
#import "Masonry.h"

@implementation ClassRoomWordCell

#pragma mark -- private method

- (void) leftClick
{
    if(self.returnWebString)
    {
        self.returnWebString();
    }
}

#pragma mark -- lazy method

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.leftView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ekw_sp_rtcwordsbackground2"]];
        self.rightView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ekw_sp_rtcwordsbackground2"]];
        [self.wordLeftButton setTitle:@"开始阅读" forState:UIControlStateNormal];
        [self.wordRightButton setTitle:@"开始阅读" forState:UIControlStateNormal];
    }
    return self;
}

- (UIView *) leftView
{
    if(!_leftView)
    {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = [UIColor purpleColor];
        [self addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(10);
            make.top.mas_equalTo(self.mas_top).offset(10);
            make.height.mas_equalTo(105);
            make.width.mas_equalTo(self.bounds.size.width/2 - 15);
        }];
    }
    return _leftView;
}

- (UIView *) rightView
{
    if(!_rightView)
    {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = [UIColor purpleColor];
        [self addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).offset(-10);
            make.top.mas_equalTo(self.mas_top).offset(10);
            make.height.mas_equalTo(105);
            make.width.mas_equalTo(self.bounds.size.width/2 - 15);
        }];
    }
    return _rightView;
}

- (UILabel *) wordLeftLabel
{
    if(!_wordLeftLabel)
    {
        _wordLeftLabel = [[UILabel alloc] init];
        _wordLeftLabel.textColor = [UIColor whiteColor];
        [self.leftView addSubview:_wordLeftLabel];
        [_wordLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.leftView.mas_centerX);
            make.top.mas_equalTo(self.leftView.mas_top).offset(20);
        }];
    }
    return _wordLeftLabel;
}

- (UIButton *) wordLeftButton
{
    if(!_wordLeftButton)
    {
        _wordLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _wordLeftButton.layer.cornerRadius = 17;
        _wordLeftButton.backgroundColor = [UIColor whiteColor];
        _wordLeftButton.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:14];
        [_wordLeftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_wordLeftButton setTitleColor:[UIColor colorWithRed:104.0f/255.0f green:180.0f/255.0f blue:252.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [self.leftView addSubview:_wordLeftButton];
        [_wordLeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.leftView.mas_centerX);
            make.top.mas_equalTo(self.leftView.mas_top).offset(50);
            make.width.mas_equalTo(100);
        }];
    }
    return _wordLeftButton;
}

- (UILabel *) wordRightLabel
{
    if(!_wordRightLabel)
    {
        _wordRightLabel = [[UILabel alloc] init];
        _wordRightLabel.textColor = [UIColor whiteColor];
        [self.rightView addSubview:_wordRightLabel];
        [_wordRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.rightView.mas_centerX);
            make.top.mas_equalTo(self.rightView.mas_top).offset(20);
        }];
    }
    return _wordRightLabel;
}

- (UIButton *) wordRightButton
{
    if(!_wordRightButton)
    {
        _wordRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _wordRightButton.layer.cornerRadius = 17;
        _wordRightButton.backgroundColor = [UIColor whiteColor];
        _wordRightButton.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:14];
        [_wordRightButton setTitleColor:[UIColor colorWithRed:104.0f/255.0f green:180.0f/255.0f blue:252.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [self.rightView addSubview:_wordRightButton];
        [_wordRightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.rightView.mas_centerX);
            make.top.mas_equalTo(self.rightView.mas_top).offset(50);
            make.width.mas_equalTo(100);
        }];
    }
    return _wordRightButton;
}

@end
