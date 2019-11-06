//
//  StudentInitializer.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/21.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "StudentInitializer.h"
#import "LearnController.h"
#import "TutorController.h"
#import "ExtendNavigation.h"

@implementation StudentInitializer

+ (void)startAppDelegate
{
    LearnController *learn = [[LearnController alloc]init];
    TutorController *tutor = [[TutorController alloc]init];
    learn.tabBarItem.title = @"学习中心";
    learn.tabBarItem.image = [UIImage imageNamed:@"icon_hw_def"];
    learn.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_hw_dis"];
    tutor.tabBarItem.title = @"口语家教";
    tutor.tabBarItem.image = [UIImage imageNamed:@"icon_hst_def"];
    tutor.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_hst_dis"];
    UINavigationController *learnNav = [[UINavigationController alloc]initWithRootViewController:learn];
     UITabBarController *tabController = [[UITabBarController alloc]init];
    UINavigationController *tutorNav = [[UINavigationController alloc]initWithRootViewController:tutor];
    tabController.tabBar.backgroundColor = [UIColor whiteColor];
    NSArray *controllerArray = [[NSArray alloc]initWithObjects:learnNav,tutorNav,nil];
    tabController.viewControllers = controllerArray;
    [UIApplication sharedApplication].delegate.window.rootViewController = tabController;
    [[UIApplication sharedApplication].delegate.window makeKeyWindow];
}

@end
