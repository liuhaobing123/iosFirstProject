//
//  WebApiList.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "WebApiList.h"

#define API_NEW_PREFIX @"http://mapi.ekwing.com/student"
#define API_NEW_PREFIX_parent @"http://mapi.ekwing.com/parent"

@interface WebApiList()

@end

@implementation WebApiList

+ (NSString *) getHolidayhwConfigApi
{
    return [NSString stringWithFormat:@"%@/%@",API_NEW_PREFIX,@"holidayhw/index"];
}

+ (NSString *)getnewmainlistApi
{
    return [NSString stringWithFormat:@"%@/%@",API_NEW_PREFIX,@"Hw/getnewmainlist"];
}

+ (NSString *)getSpeakHomeOutsideDataAPI
{
    return [NSString stringWithFormat:@"%@/%@",API_NEW_PREFIX,@"spoken/index"];
}

+ (NSString *)getSpeakHomeDetailDataAPI
{
    return [NSString stringWithFormat:@"%@/%@",API_NEW_PREFIX,@"spoken/getcnt"];
}

// 获得HTML代码API
+ (NSString *)getHTMLAPI
{
    return [NSString stringWithFormat:@"%@/%@",API_NEW_PREFIX_parent,@"url/get"];
}

// 获得HTML代码API
+ (NSString *)getCurrentDubAPI
{
    return [NSString stringWithFormat:@"%@/%@",API_NEW_PREFIX_parent,@"msg/record"];
}

@end
