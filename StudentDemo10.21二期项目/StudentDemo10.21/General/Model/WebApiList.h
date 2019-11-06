//
//  WebApiList.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebApiList : NSObject

+ (NSString *) getHolidayhwConfigApi;
+ (NSString *)getnewmainlistApi;
+ (NSString *)getSpeakHomeOutsideDataAPI;
+ (NSString *)getSpeakHomeDetailDataAPI;
+ (NSString *)getHTMLAPI;
+ (NSString *)getCurrentDubAPI;

@end

NS_ASSUME_NONNULL_END
