//
//  HistoryController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/22.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "HistoryController.h"
#import "ToolConstants.h"
#import "UITableList.h"

#define scrollWidth 150

@interface HistoryController ()

//@property (nonatomic,retain) UIScrollList *scrollList;
@property (nonatomic,retain) UIButton *rightButton;
@property (nonatomic,retain) UIButton *leftButton;
@property (nonatomic,retain) NSArray *titleData;
@property (nonatomic,retain) UITableList *trainTableList;
@property (nonatomic,retain) UITableList *extendTableList;
@property (nonatomic,retain) UITableList *testTableList;

@end

@implementation HistoryController

- (void)loadView
{
    [super loadView];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.automaticallyCalculatesItemWidths = YES;
    self.progressWidth = 25;
    self.titleSizeSelected = 18;
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
    self.itemMargin = WMMenuViewLayoutModeCenter;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setHistoryNav];
    //[self setElement];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - Datasource & Delegate

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titleData.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            self.trainTableList = [[UITableList alloc]init];
            return self.trainTableList;
        }
            break;
        case 1:
        {
            self.extendTableList = [[UITableList alloc]init];
            return self.extendTableList;
        }
            break;
        default:
        {
            self.testTableList = [[UITableList alloc]init];
            return self.testTableList;
        }
            break;
    }
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    return self.titleData[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    return CGRectMake(0, 50, SY_WIDTH, SY_HEIGHT - 50 - 64);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
     return CGRectMake(0, 0, SY_WIDTH, 50);
}


#pragma mark -- private method

- (void) setHistoryNav
{
    self.title = @"历史";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
}

- (void) leftArcButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) rightArcButtonClick
{
   
}

#pragma mark -- lazy method

- (UIButton *)rightButton
{
    if(!_rightButton)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(0, 0, imageW, imageH);
        [_rightButton setTitle:@"归档" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, -2.5, 0, 5);
        [_rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(rightArcButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (UIButton *)leftButton
{
    if(!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 0, imageW, imageH);
        [_leftButton setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(leftArcButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (NSArray *)titleData {
    if (!_titleData) {
        _titleData = @[@"训练", @"扩展", @"考试"];
    }
    return _titleData;
}

@end
