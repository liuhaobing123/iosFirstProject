//
//  NSRequest.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSRequest : NSObject

+ (void) getHolidayhwConfigRequestprogress:(void (^)(id success))success;
+ (void) getnewmainlistRequestprogress:(void (^)(id success))success;
+ (void) getSpeakHomeOutsideDataAPIRequestprogress:(void (^)(id success))success;
+ (void) getSpeakHomeDetailDataAPIRequestprogress:(NSString *)bookId getChapter:(NSString *)chapterId getBiz:(NSString *)biz isSuccess:(void (^)(id success))success;
+ (void) getHtmlRequestprogress:(void (^)(id success))success;
+ (void) getCurrentDubAPIprogress:(void (^)(id success))success;

@end

NS_ASSUME_NONNULL_END
