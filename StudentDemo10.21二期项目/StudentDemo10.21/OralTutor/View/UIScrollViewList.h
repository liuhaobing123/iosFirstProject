//
//  UIScrollViewList.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/23.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContentController;

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollViewList : UIView

@property (nonatomic,retain) UIScrollView *scrollList;
@property (nonatomic,retain) ContentController *conController;

@end

NS_ASSUME_NONNULL_END
