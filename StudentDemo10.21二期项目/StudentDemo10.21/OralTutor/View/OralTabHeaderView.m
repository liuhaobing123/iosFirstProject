//
//  LearnTabHeaderView.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/28.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "OralTabHeaderView.h"

#define scrollBoundWidth  self.bounds.size.width
#define scrollBoundHeight  self.bounds.size.height

@implementation OralTabHeaderView

#pragma mark -- lazy method

- (UILabel *)headerLaber
{
    if(!_headerLaber)
    {
        _headerLaber = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, scrollBoundWidth/2, 30)];
        [self addSubview:_headerLaber];
        
    }
    return _headerLaber;
}

- (UIButton *)headerButton
{
    if(!_headerButton)
    {
        self.headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headerButton.frame = CGRectMake(scrollBoundWidth/3*2 - 10, 0,scrollBoundWidth/3, 30);
        [self.headerButton setTitle:@"学习进度0/8" forState:UIControlStateNormal];
        [self.headerButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self.headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_headerButton];
    }
    return _headerButton;
}

@end
