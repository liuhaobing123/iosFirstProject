//
//  ClassRoomWordCell.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/27.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassRoomWordCell : UITableViewCell

@property (nonatomic,retain) UIView *leftView;
@property (nonatomic,retain) UIView *rightView;
@property (nonatomic,retain) UIButton *wordLeftButton;
@property (nonatomic,retain) UIButton *wordRightButton;
@property (nonatomic,retain) UILabel *wordLeftLabel;
@property (nonatomic,retain) UILabel *wordRightLabel;
@property (nonatomic,copy) void(^returnWebString)(void);

@end

NS_ASSUME_NONNULL_END
