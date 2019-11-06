//
//  BaseVCController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/22.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "BaseVCController.h"

@interface BaseVCController ()

@end

@implementation BaseVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark -- private method

- (UINavigationController *)context
{
    return self.navigationController;
}

@end
