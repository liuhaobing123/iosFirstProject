//
//  DataListRequest.h
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/26.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataListRequest : NSObject

+ (instancetype) shareManager;
- (void) getSpeakHomeOutsideData:(void (^)(id Data))getData;
- (void) getSpeakHomeDetailData:(NSString *)bookId getChapter:(NSString *)chapterId getBiz:(NSString *)biz isSuccess:(void (^)(id success))getData;
- (void)getHtmlRequestData:(void (^)(id Data))getData;
- (void)getCurrentData:(void (^)(id Data))getData;

@end

NS_ASSUME_NONNULL_END
