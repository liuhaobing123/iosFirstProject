//
//  videoPlayTabCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/29.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "videoPlayTabCell.h"
#import "Masonry.h"

@interface videoPlayTabCell()

@property (retain,nonatomic) UIImageView *leftPlayView;
@property (retain,nonatomic) UIImageView *rightPlayView;

@end

@implementation videoPlayTabCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.leftView.backgroundColor = [UIColor whiteColor];
        self.rightView.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

#pragma mark -- private method

- (void) leftImageViewTap
{
    if(self.returnString)
    {
        self.returnString();
    }
}

- (void) rightImageViewTap
{
    NSLog(@"2");
}

#pragma mark -- lazy method

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

- (UIImageView *) leftImagePlayView
{
    if(!_leftImagePlayView)
    {
        _leftImagePlayView = [[UIImageView alloc] init];
        _leftPlayView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ekw_hs_columnDub_play"]];
        UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftImageViewTap)];
        _leftImagePlayView.userInteractionEnabled = YES;
        [_leftImagePlayView addGestureRecognizer:leftTap];
        [_leftView addSubview:_leftImagePlayView];
        [_leftImagePlayView addSubview:_leftPlayView];
        [_leftImagePlayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftView.mas_top);
            make.bottom.mas_equalTo(self.leftView.mas_bottom).offset(-25);
            make.centerX.mas_equalTo(self.leftView.mas_centerX);
            make.width.mas_equalTo(self.leftView.mas_width);
        }];
        [_leftPlayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.leftImagePlayView.mas_centerX);
            make.centerY.mas_equalTo(self.leftImagePlayView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return _leftImagePlayView;
}

- (UIImageView *) rightImagePlayView
{
    if(!_rightImagePlayView)
    {
        _rightImagePlayView = [[UIImageView alloc] init];
        _rightPlayView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ekw_hs_columnDub_play"]];
        UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightImageViewTap)];
        _rightImagePlayView.userInteractionEnabled = YES;
        [_rightImagePlayView addGestureRecognizer:rightTap];
        [_rightView addSubview:_rightImagePlayView];
        [_rightImagePlayView addSubview:_rightPlayView];
        [_rightImagePlayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.rightView.mas_top);
            make.bottom.mas_equalTo(self.rightView.mas_bottom).offset(-25);
            make.centerX.mas_equalTo(self.rightView.mas_centerX);
            make.width.mas_equalTo(self.rightView.mas_width);
        }];
        [_rightPlayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.rightImagePlayView.mas_centerX);
            make.centerY.mas_equalTo(self.rightImagePlayView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return _rightImagePlayView;
}

- (UILabel *) leftNameLabel
{
    if(!_leftNameLabel)
    {
        _leftNameLabel = [[UILabel alloc] init];
        _leftNameLabel.font = [UIFont fontWithName:@"ArialMT" size:16];
        [_leftView addSubview:_leftNameLabel];
        [_leftNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(25);
            make.bottom.mas_equalTo(self.leftView.mas_bottom).offset(0);
            make.centerX.mas_equalTo(self.leftView.mas_centerX);
            make.width.mas_equalTo(self.leftView.mas_width);
        }];
    }
    return _leftNameLabel;
}

- (UILabel *) rightNameLabel
{
    if(!_rightNameLabel)
    {
        _rightNameLabel = [[UILabel alloc] init];
        _rightNameLabel.font = [UIFont fontWithName:@"ArialMT" size:16];
        [_rightView addSubview:_rightNameLabel];
        [_rightNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(25);
            make.bottom.mas_equalTo(self.rightView.mas_bottom).offset(0);
            make.centerX.mas_equalTo(self.rightView.mas_centerX);
            make.width.mas_equalTo(self.rightView.mas_width);
        }];
    }
    return _rightNameLabel;
}

@end
