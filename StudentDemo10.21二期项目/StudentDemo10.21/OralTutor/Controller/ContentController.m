//
//  ContentController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/24.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "ContentController.h"
#import "ToolConstants.h"
#import "ClassRoomTable.h"
#import "OutClassTable.h"

@interface ContentController ()

@property (nonatomic,retain) ClassRoomTable *roomTable;
@property (nonatomic,retain) OutClassTable *classTable;
@property (nonatomic,retain) NSArray *titleData;

@end

@implementation ContentController

- (void)loadView
{
    [super loadView];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.automaticallyCalculatesItemWidths = YES;
    self.progressWidth = 25;
    self.titleSizeSelected = 18;
    self.progressViewIsNaughty = YES;
    self.titleColorSelected = [UIColor colorWithRed:63.0f/255.0f green:162.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.titleColorNormal = [UIColor colorWithRed:71.0f/255.0f green:85.0f/255.0f blue:95.0f/255.0f alpha:1.0f];
    self.progressColor = [UIColor colorWithRed:63.0f/255.0f green:162.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    self.progressHeight = 3;
    self.titleSizeNormal = 18;
    self.progressViewBottomSpace = 5;
    self.progressViewCornerRadius = 2;
    self.showOnNavigationBar = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Datasource & Delegate

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    return self.titleData[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    return CGRectMake(0, 50, SY_WIDTH, SY_HEIGHT - self.tabBarController.tabBar.frame.size.height);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    return CGRectMake(0, 0, SY_WIDTH, 50);
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titleData.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            self.roomTable = [[ClassRoomTable alloc] init];
            return self.roomTable;
        }
            break;
        default:
        {
            self.classTable = [[OutClassTable alloc] init];
            return self.classTable;
        }
            break;
    }
}

#pragma mark - private method

- (NSArray *)titleData {
    if (!_titleData) {
        _titleData = @[@"课堂同步", @"课外扩展"];
    }
    return _titleData;
}

@end
