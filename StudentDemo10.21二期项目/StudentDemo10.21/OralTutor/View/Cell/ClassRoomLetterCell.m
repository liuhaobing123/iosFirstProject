//
//  ClassRoomLetterCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/27.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "ClassRoomLetterCell.h"
#import "ToolConstants.h"
#import "Masonry.h"

@implementation ClassRoomLetterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.leftButton setTitle:@"试听点读" forState:UIControlStateNormal];
        [self.rightButton setTitle:@"试听阅读" forState:UIControlStateNormal];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ekw_sp_rtcbackground"]];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    self.layer.cornerRadius = 10;
    frame.origin.x += 10;
    frame.origin.y += 10;
    frame.size.height -= 20;
    frame.size.width -= 20;
    [super setFrame:frame];
}

#pragma mark -- lazy method

- (UILabel *) wordLabel
{
    if(!_wordLabel)
    {
        _wordLabel = [[UILabel alloc] init];
        _wordLabel.textColor = [UIColor whiteColor];
        [self addSubview:_wordLabel];
        [_wordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.mas_top).offset(30);
        }];
    }
    return _wordLabel;
}

- (UIButton *) leftButton
{
    if(!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.layer.cornerRadius = 17;
        _leftButton.layer.borderWidth = 2;
        _leftButton.backgroundColor = [UIColor clearColor];
        _leftButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _leftButton.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:14];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX).offset(-60);
            make.top.mas_equalTo(self.mas_top).offset(65);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
        }];
    }
    return _leftButton;
}

- (UIButton *) rightButton
{
    if(!_rightButton)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.layer.cornerRadius = 17;
        _rightButton.backgroundColor = [UIColor whiteColor];
        _rightButton.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:14];
        [_rightButton setTitleColor:[UIColor colorWithRed:104.0f/255.0f green:180.0f/255.0f blue:252.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [self addSubview:_rightButton];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX).offset(60);;
            make.top.mas_equalTo(self.mas_top).offset(65);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
        }];
    }
    return _rightButton;
}

@end
