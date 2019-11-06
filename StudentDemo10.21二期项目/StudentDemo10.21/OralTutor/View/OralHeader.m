//
//  OralHeader.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "OralHeader.h"
#import "Masonry.h"
#import "ToolConstants.h"

@interface OralHeader()

@property (nonatomic,retain) UILabel *suspensionViewHeaderLabel;
@property (nonatomic,retain) UIButton *suspensionViewAccomplishButton;
@property (nonatomic,retain) UIButton *suspensionViewRankButton;
@property (nonatomic,retain) UIImageView *pkImageView;

@end

@implementation OralHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self suspensionViewHeaderLabel];
        [self suspensionViewAccomplishButton];
        [self suspensionViewRankButton];
        [self pkImageView];
    }
    return self;
}

#pragma mark -- private method

- (void) tapGes:(UITapGestureRecognizer *)ges
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushView" object:nil];
}

#pragma mark -- lazy method

- (UILabel *) suspensionViewHeaderLabel
{
    if(!_suspensionViewHeaderLabel)
    {
        _suspensionViewHeaderLabel = [[UILabel alloc]init];
        _suspensionViewHeaderLabel.text = @"口语家教";
        _suspensionViewHeaderLabel.font = [UIFont boldSystemFontOfSize:19];
        _suspensionViewHeaderLabel.textColor = [UIColor blackColor];
        [self addSubview:_suspensionViewHeaderLabel];
        [_suspensionViewHeaderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80, 40));
            make.top.mas_equalTo(self.mas_top).with.offset(33);
            make.left.mas_equalTo(self.mas_left).with.offset(30);
        }];
    }
    return _suspensionViewHeaderLabel;
}

- (UIButton *) suspensionViewAccomplishButton
{
    if(!_suspensionViewAccomplishButton)
    {
        _suspensionViewAccomplishButton = [[UIButton alloc] init];
        [_suspensionViewAccomplishButton setBackgroundImage:[UIImage imageNamed:@"ekw_sp_rank"] forState:UIControlStateNormal];
        [self addSubview:_suspensionViewAccomplishButton];
        [_suspensionViewAccomplishButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 25));
            make.top.mas_equalTo(self.mas_top).with.offset(40);
            make.left.mas_equalTo(self.suspensionViewHeaderLabel.mas_right).with.offset(35);
        }];
    }
    return _suspensionViewAccomplishButton;
}

- (UIButton *) suspensionViewRankButton
{
    if(!_suspensionViewRankButton)
    {
        _suspensionViewRankButton = [[UIButton alloc] init];
        [_suspensionViewRankButton setBackgroundImage:[UIImage imageNamed:@"ekw_sp_star"] forState:UIControlStateNormal];
        [self addSubview:_suspensionViewRankButton];
        [_suspensionViewRankButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 25));
            make.top.mas_equalTo(self.mas_top).with.offset(40);
        make.left.mas_equalTo(self.suspensionViewAccomplishButton.mas_right).with.offset(20);
        }];
    }
    return _suspensionViewRankButton;
}

- (UIImageView *) pkImageView
{
    if(!_pkImageView)
    {
        UIImage *image = [UIImage imageNamed:@"ekw_sp_pkimage"];
        _pkImageView = [[UIImageView alloc] initWithImage:image];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
        _pkImageView.userInteractionEnabled = YES;
        [self addSubview:_pkImageView];
        [_pkImageView addGestureRecognizer:tapGesture];
        [_pkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset(SY_WIDTH - 40);
            make.top.mas_equalTo(self.suspensionViewHeaderLabel).with.offset(60);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
    return _pkImageView;
}

@end
