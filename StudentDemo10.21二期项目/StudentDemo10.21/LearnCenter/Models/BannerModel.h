//
//  BannerModel.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/25.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerModel : NSObject

@property (nonatomic, copy) NSString *vacationTitle;
@property (nonatomic, copy) NSString *vacationDescribe;
@property (nonatomic, copy) NSString *vacationImage;
@property (nonatomic, assign) BOOL vacationVisible;

@property (nonatomic, copy) NSString *vipTitle;
@property (nonatomic, copy) NSString *vipDescribe;
@property (nonatomic, copy) NSString *vipImage;
@property (nonatomic, assign) BOOL vipVisible;

@end

NS_ASSUME_NONNULL_END
