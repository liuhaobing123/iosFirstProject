//
//  LearnTableViewList.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BannerModel;

@interface LearnTableViewList : UIView

@property (nonatomic,retain) UITableView *learnTableView;
@property (nonatomic,retain) BannerModel *banenr;
@property (nonatomic,retain) NSMutableArray *HwListArray;

@end

NS_ASSUME_NONNULL_END
