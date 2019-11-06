//
//  TableWebCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/25.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "TableWebCell.h"
#import "ToolConstants.h"
#import "Masonry.h"

@interface TableWebCell()

@property (nonatomic,retain) UIImage *banderImage;
@property (nonatomic,retain) UILabel *banderLine1;
@property (nonatomic,retain) UILabel *banderLine2;

@end

@implementation TableWebCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    self.layer.cornerRadius = 10;
    frame.origin.x += 15;
    frame.origin.y += 8;
    frame.size.height -= 16;
    frame.size.width -= 30;
    [super setFrame:frame];
}

- (void) setStrLine1:(NSString *)strLine1
{
    if(!_strLine1)
    {
        self.banderLine1 = [[UILabel alloc]init];
        self.banderLine1.text = strLine1;
        self.banderLine1.font = [UIFont fontWithName:@"ArialMT" size:16];
        self.banderLine1.textColor = [UIColor grayColor];
        [self addSubview:self.banderLine1];
        [_banderLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((SY_WIDTH - 30)/3, 30));
            make.left.mas_equalTo(self.mas_left).offset(20);
            make.top.mas_equalTo(self.mas_top).offset(30);
        }];
    }
}

- (void)setStrLine2:(NSString *)strLine2
{
    if(!_strLine2)
    {
        self.banderLine2 = [[UILabel alloc]init];
        self.banderLine2.text = strLine2;
        self.banderLine2.font = [UIFont fontWithName:@"ArialMT" size:14];
        self.banderLine2.textColor = [UIColor grayColor];
        [self addSubview:self.banderLine2];
        [_banderLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((SY_WIDTH - 30)/2, 30));
            make.left.mas_equalTo(self.mas_left).offset(20);
            make.top.mas_equalTo(self.mas_top).offset(60);
        }];
    }
}

#pragma mark -- lazy method

- (UIImageView *)banderImageView
{
    if(!_banderImageView)
    {
        _banderImageView = [[UIImageView alloc]init];
        [self addSubview:_banderImageView];
        [_banderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((SY_WIDTH - 30)/2, _learncenter_maincell_height - 30));
            make.right.mas_equalTo(self.mas_right).offset(-10);
            make.top.mas_equalTo(self.mas_top).offset(10);
        }];
    }
    return _banderImageView;
}

@end
