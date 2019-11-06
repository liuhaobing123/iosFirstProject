//
//  ButtonView.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "ButtonView.h"

@interface ButtonView()

@property (nonatomic,retain) UIButton *raceButton;
@property (nonatomic,retain) UIButton *tyroTaskButton;

@end

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self raceButton];
        [self tyroTaskButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.raceButton.frame = CGRectMake(0, 0, 60, 70);
    self.tyroTaskButton.frame = CGRectMake(0, 70, 60, 70);
}


#pragma mark -- lazy method

- (UIButton *) raceButton
{
    if (!_raceButton)
    {
        _raceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_raceButton setImage:[UIImage imageNamed:@"ekw_learenCtr_noob_get_norl"] forState:UIControlStateNormal];
        [self addSubview:_raceButton];
    }
    return _raceButton;
}

- (UIButton *) tyroTaskButton
{
    if (!_tyroTaskButton)
    {
        _tyroTaskButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tyroTaskButton setImage:[UIImage imageNamed:@"ekw_learncenter_race_normal"] forState:UIControlStateNormal];
        [self addSubview:_tyroTaskButton];
    }
    return _tyroTaskButton;
}

@end
