//
//  TableViewCell.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (nonatomic,retain) UIImageView *imageType;
@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UIImageView *imageNew;
@property (nonatomic,retain) UILabel *timeLabel;
@property (nonatomic,retain) UIImageView *lineImageView;
@property (nonatomic,retain) UILabel *finishLabel;
@property (nonatomic,retain) UILabel *progressLabel;
@property (nonatomic,retain) UIProgressView *progressView;

@end

NS_ASSUME_NONNULL_END
