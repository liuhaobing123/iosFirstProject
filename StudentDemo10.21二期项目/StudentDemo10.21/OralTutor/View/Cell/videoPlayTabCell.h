//
//  videoPlayTabCell.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/29.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface videoPlayTabCell : UITableViewCell

@property (nonatomic,retain) UIView *leftView;
@property (nonatomic,retain) UIView *rightView;
@property (retain,nonatomic) UIImageView *leftImagePlayView;
@property (retain,nonatomic) UIImageView *rightImagePlayView;
@property (retain,nonatomic) UILabel *leftNameLabel;
@property (retain,nonatomic) UILabel *rightNameLabel;
@property (nonatomic,copy) void(^returnString)(void);

@end

NS_ASSUME_NONNULL_END
