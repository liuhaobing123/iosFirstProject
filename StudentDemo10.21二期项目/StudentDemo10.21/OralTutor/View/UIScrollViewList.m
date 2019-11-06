//
//  UIScrollViewList.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "UIScrollViewList.h"
#import "ToolConstants.h"
#import "OralHeader.h"
#import "Masonry.h"
#import "ContentController.h"

#define scrollBoundWidth  self.bounds.size.width
#define scrollBoundHeight  self.bounds.size.height

@interface UIScrollViewList()
<UIScrollViewDelegate>

@property (nonatomic,retain) OralHeader *header;

@end

@implementation UIScrollViewList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self scrollList];
        [self setElements];
        [self conController];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.scrollList.frame = CGRectMake(0, 0, scrollBoundWidth, scrollBoundHeight);
}

#pragma mark -- private method

- (void) setElements
{
    self.header = [[OralHeader alloc] init];
    [self.scrollList addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SY_WIDTH, 184));
        make.top.mas_equalTo(self.scrollList.mas_top).offset(0);
        make.left.mas_equalTo(self.scrollList.mas_left).offset(0);
    }];
}

#pragma mark -- lazy method

- (UIScrollView *) scrollList
{
    if(!_scrollList)
    {
        _scrollList = [[UIScrollView alloc] init];
        _scrollList.delegate = self;
        _scrollList.backgroundColor = [UIColor colorWithRed:198.0f/255.0f green:198.0f/255.0f blue:198.0f/255.0f alpha:1.0f];
        _scrollList.scrollEnabled = YES;
        _scrollList.pagingEnabled = NO;
        _scrollList.contentSize = CGSizeMake(SY_WIDTH, SY_HEIGHT + 144);
        _scrollList.bounces = NO;
        _scrollList.showsHorizontalScrollIndicator = YES;
        [self addSubview:_scrollList];
    }
    return _scrollList;
}

- (ContentController *) conController
{
    if(!_conController)
    {
        _conController = [[ContentController alloc] init];
        [self.scrollList addSubview:_conController.view];
        [_conController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(SY_WIDTH);
            make.height.offset(SY_HEIGHT);
            make.left.mas_equalTo(self.scrollList.mas_left).offset(0);
            make.top.mas_equalTo(self.header.mas_bottom).with.offset(10);
        }];
    }
    return _conController;
}

@end
