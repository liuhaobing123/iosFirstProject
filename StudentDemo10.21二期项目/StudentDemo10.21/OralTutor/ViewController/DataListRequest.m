//
//  DataListRequest.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/26.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "DataListRequest.h"
#import "NSRequest.h"
#import "MJExtension.h"
#import "ACDModel.h"
#import "VideoModel.h"

@interface DataListRequest()

@property (nonatomic,retain) ACDModel *model;
@property (nonatomic,retain) VideoModel *videoModel;

@end

@implementation DataListRequest

+ (instancetype) shareManager
{
    static DataListRequest *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)getSpeakHomeOutsideData:(void (^)(id _Nonnull))getData
{
    [NSRequest getSpeakHomeOutsideDataAPIRequestprogress:^(id  _Nonnull success) {
        if(success)
        {
          self.model = [ACDModel mj_objectWithKeyValues:[success objectForKey:@"data"]];
         }
        getData(self.model);
    }];
}

- (void)getSpeakHomeDetailData:(NSString *)bookId getChapter:(NSString *)chapterId getBiz:(NSString *)biz isSuccess:(void (^)(id _Nonnull))getData
{
    [NSRequest getSpeakHomeDetailDataAPIRequestprogress:bookId getChapter:chapterId getBiz:biz isSuccess:^(id  _Nonnull success) {
        if(success)
        {
            self.model = [ACDModel mj_objectWithKeyValues:success];
        }
        getData(self.model);
    }];
}

- (void)getHtmlRequestData:(void (^)(id _Nonnull))getData
{
    [NSRequest getHtmlRequestprogress:^(id  _Nonnull success) {
        if(success)
        {
            getData(success);
        }
    }];
}

- (void)getCurrentData:(void (^)(id _Nonnull))getData
{
    [NSRequest getCurrentDubAPIprogress:^(id  _Nonnull success) {
        if(success)
        {
            self.videoModel = [VideoModel mj_objectWithKeyValues:success];
        }
        getData(self.videoModel);
    }];
}

@end
