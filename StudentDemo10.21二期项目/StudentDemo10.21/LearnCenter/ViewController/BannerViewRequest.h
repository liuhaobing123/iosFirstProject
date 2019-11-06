//
//  BannerViewController.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/26.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface BannerViewRequest : NSObject


+ (instancetype) shareManager;

- (void) getHolidayhw:(void (^)(id Data))getData;
- (void) getnewmainlist:(void (^)(id Data))getData;

@end

NS_ASSUME_NONNULL_END
