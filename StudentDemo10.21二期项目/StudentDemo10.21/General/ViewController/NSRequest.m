//
//  NSRequest.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "NSRequest.h"
#import "AFNetworking.h"
#import "WebApiList.h"
#import "WebData.h"

@interface NSRequest()

@end

@implementation NSRequest

+ (void) getHolidayhwConfigRequestprogress:(void (^)(id success))success
{
    NSDictionary *paramDict = @{
                                @"uid":[WebData getUid],
                                @"v":[WebData getV],
                                @"token":[WebData getToken]};
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager POST:[WebApiList getHolidayhwConfigApi] parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败--%@",error);
    }];
}

+ (void) getnewmainlistRequestprogress:(void (^)(id success))success
{
    NSDictionary *paramDict = @{
                                @"uid":[WebData getUid],
                                @"v":[WebData getV],
                                @"token":[WebData getToken]};
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager POST:[WebApiList getnewmainlistApi] parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败--%@",error);
    }];
}

+ (void) getSpeakHomeOutsideDataAPIRequestprogress:(void (^)(id success))success
{
    NSDictionary *paramDict = @{
                                @"uid":[WebData getUid],
                                @"v":[WebData getV],
                                @"token":[WebData getToken]};
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager POST:[WebApiList getSpeakHomeOutsideDataAPI] parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
           success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败--%@",error);
    }];
}

+ (void)getSpeakHomeDetailDataAPIRequestprogress:(NSString *)bookId getChapter:(NSString *)chapterId getBiz:(NSString *)biz isSuccess:(void (^)(id _Nonnull))success
{
    NSDictionary *paramDict = @{
                                @"book_id":bookId,
                                @"chapter_id":chapterId,
                                @"biz":biz};
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager POST:[WebApiList getSpeakHomeDetailDataAPI] parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败--%@",error);
    }];
}

+ (void) getHtmlRequestprogress:(void (^)(id success))success
{
    NSDictionary *paramDict = @{
                                @"driveCode":@"2.9.0",
                                @"os":@"ios",
                                @"osv":@"9.3",
                                @"product":@"parent",
                                @"v":@"1.9",
                                @"type":@"privacy"
                               };
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];//设置相应内容类型
    
    [manager POST:[WebApiList getHTMLAPI] parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]])
         {
            success([[responseObject objectForKey:@"data"] objectForKey:@"url"]);
         }
       }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败--%@",error);
        }];
}

+ (void) getCurrentDubAPIprogress:(void (^)(id success))success
{
    NSDictionary *paramDict = @{
                                @"token":
                                     @"OMzc2MTg3OCMjIyM3NjE4ZmY0ZmQyZDU2ZWVkOTcwZTRiZTE4ZWI5MWJiNCMjMzQxMTgwODYwYTQwYjU0OTdhZDY0MmZlYjZiMmM5YmYjIzE1NzUxMDA2MzkjIzMjIzMjI2Vrd19wYXJlbnQ=i",
                                @"uid":@"3761878",
                                @"v":@"1.9",
                                @"product":@"parent",
                                @"sid":@"21306492",
                                @"stu_id":@"2231118"
                                };
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager POST:[WebApiList getCurrentDubAPI] parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            success([[[responseObject objectForKey:@"data"] objectForKey:@"info"] objectForKey:@"text"]);
            
        }
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"请求失败--%@",error);
          }];
}

@end
