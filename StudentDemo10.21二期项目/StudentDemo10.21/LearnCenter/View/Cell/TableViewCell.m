//
//  TableViewCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "TableViewCell.h"
#import "ToolConstants.h"
#import "Masonry.h"

#define scrollBoundWidth  self.bounds.size.width
#define scrollBoundHeight  self.bounds.size.height

@interface TableViewCell()


@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.imageNew = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ekw_status_new"]];
        self.lineImageView.backgroundColor = [UIColor grayColor];
        self.finishLabel.text = @"完成进度";
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    self.layer.cornerRadius = 10;
    frame.origin.x += 15;
    frame.origin.y += 8;
    frame.size.height -= 16;
    frame.size.width -= 30;
    [super setFrame:frame];
}

#pragma mark -- property get method

- (void) setImageType:(UIImageView *)imageType
{
    if(!_imageType)
    {
        _imageType = imageType;
        [self addSubview:_imageType];
        [_imageType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(40, 40));
            make.top.mas_equalTo(self.mas_top).offset(20);
            make.left.mas_equalTo(self.mas_left).offset(10);
        }];
    }
}

- (void) setImageNew:(UIImageView *)imageNew
{
    if(!_imageNew)
    {
        _imageNew = imageNew;
        [self addSubview:_imageNew];
        [_imageNew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(17, 17));
            make.top.mas_equalTo(self.mas_top).offset(20);
            make.left.mas_equalTo(self.titleLabel.mas_right).offset(5);

        }];
    }
}

#pragma mark -- lazy method

- (UILabel *) titleLabel
{
    if(!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont fontWithName:@"ArialMT" size:16];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(16);
            make.top.mas_equalTo(self.mas_top).offset(20);
            make.left.mas_equalTo(self.mas_left).offset(60);
        }];
    }
    return _titleLabel;
}

- (UILabel *) timeLabel
{
    if(!_timeLabel)
    {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont fontWithName:@"ArialMT" size:14];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(170, 16));
            make.top.mas_equalTo(self.mas_top).offset(40);
            make.left.mas_equalTo(self.mas_left).offset(60);
        }];
    }
    return _timeLabel;
}

- (UIImageView *) lineImageView
{
    if(!_lineImageView)
    {
        _lineImageView = [[UIImageView alloc] init];
        [self addSubview:_lineImageView];
        [_lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(260, 0.3));
            make.top.mas_equalTo(self.mas_top).offset(65);
        }];
    }
    return _lineImageView;
}

- (UILabel *) finishLabel
{
    if(!_finishLabel)
    {
        _finishLabel = [[UILabel alloc] init];
        _finishLabel.font = [UIFont fontWithName:@"ArialMT" size:12];
        [self addSubview:_finishLabel];
        [_finishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 10));
            make.top.mas_equalTo(self.lineImageView.mas_top).offset(10);
            make.left.mas_equalTo(self.lineImageView.mas_left);
        }];
    }
    return _finishLabel;
}

- (UILabel *) progressLabel
{
    if(!_progressLabel)
    {
        _progressLabel = [[UILabel alloc] init];
        _progressLabel.textColor = [UIColor colorWithRed:80.0f/255.0f green:185.0f/255.0f blue:243.0f/255.0f alpha:1.0f];
        _progressLabel.font = [UIFont fontWithName:@"ArialMT" size:12];
        [self addSubview:_progressLabel];
        [_progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 10));
            make.top.mas_equalTo(self.lineImageView.mas_top).offset(10);
            make.right.mas_equalTo(self.lineImageView.mas_right);
        }];
    }
    return _progressLabel;
}

- (UIProgressView *) progressView
{
    if(!_progressView)
    {
        _progressView = [[UIProgressView alloc] init];
        _progressView.progressViewStyle = UIProgressViewStyleDefault;
        _progressView.clipsToBounds = YES;
        _progressView.layer.cornerRadius = 3;
        _progressView.progressTintColor = [UIColor colorWithRed:80.0f/255.0f green:185.0f/255.0f blue:243.0f/255.0f alpha:1.0f];
        _progressView.trackTintColor = [UIColor grayColor];
        [self addSubview:_progressView];
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(260, 4));
            make.top.mas_equalTo(self.progressLabel.mas_bottom).offset(10);
        }];
    }
    return _progressView;
}

@end
