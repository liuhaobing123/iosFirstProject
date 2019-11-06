//
//  BannerViewController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/26.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "BannerViewRequest.h"
#import "NSRequest.h"
#import "BannerModel.h"
#import "EKWHwMainListModel.h"
#import "MJExtension.h"

@interface BannerViewRequest()

@property (nonatomic,retain) NSMutableArray *HwListArray;
@property (nonatomic,retain) EKWHwMainListModel *HwList;
@property (nonatomic,retain) BannerModel *banenr;

@end

@implementation BannerViewRequest

+ (instancetype) shareManager
{
    static BannerViewRequest *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)getHolidayhw:(void (^)(id _Nonnull))getData
{
    //网络请求
    [NSRequest getHolidayhwConfigRequestprogress:^(id  _Nonnull success) {
        if(success)
        {
            self.banenr = [BannerModel mj_objectWithKeyValues:[success objectForKey:@"data"]];
        }
        getData(self.banenr);
    }];
}

- (void) getnewmainlist:(void (^)(id Data))getData
{
    self.HwListArray = [[NSMutableArray alloc] init];
    [NSRequest getnewmainlistRequestprogress:^(id  _Nonnull success) {
        if(success)
        {
            for(NSDictionary *dic in [success objectForKey:@"data"])
            {
                self.HwList = [EKWHwMainListModel mj_objectWithKeyValues:dic];
                if(self.HwList)
                {
                  [self.HwListArray addObject:self.HwList];
                }
            }
        }
        getData(self.HwListArray);
    }];

}

@end
