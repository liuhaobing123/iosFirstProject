//
//  TableImageCell.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "TableImageCell.h"
#import "ToolConstants.h"
#import "Masonry.h"

#define scrollBoundWidth  self.bounds.size.width
#define scrollBoundHeight  self.bounds.size.height

@interface TableImageCell()

@property (nonatomic,retain) UIImage *banderImage;

@end

@implementation TableImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.banderImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ekw_learncenter_banner_default"]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
     return self;
}

- (void)setBanderImageView:(UIImageView *)banderImageView
{
    if(!_banderImageView)
    {
        _banderImageView = banderImageView;
        [self addSubview:self.banderImageView];
        [_banderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SY_WIDTH - 30, _learncenter_maincell_height - 30));
            make.left.mas_equalTo(self.mas_left).offset(15);
            make.top.mas_equalTo(self.mas_top).offset(15);
        }];
    }
}

@end
