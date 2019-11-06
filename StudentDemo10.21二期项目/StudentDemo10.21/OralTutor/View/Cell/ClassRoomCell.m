//
//  ClassRoomCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/27.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "ClassRoomCell.h"
#import "Masonry.h"

@implementation ClassRoomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithRed:146.0f/255.0f green:164.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    self.layer.cornerRadius = 22;
    frame.origin.x += 19;
    frame.origin.y += 8;
    frame.size.height -= 37;
    frame.size.width -= 38;
    [super setFrame:frame];
}

#pragma mark -- lazt method

- (UILabel *)headerLabel
{
    if(!_headerLabel)
    {
        _headerLabel = [[UILabel alloc] init];
        _headerLabel.font = [UIFont systemFontOfSize:16];
        _headerLabel.textColor = [UIColor purpleColor];
        [self addSubview:_headerLabel];
        [_headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 60, 30));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
    return _headerLabel;
}

@end
