//
//  H5ViewController.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/28.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "H5ViewController.h"
#import "ToolConstants.h"

@interface H5ViewController ()

@property (nonatomic,retain) UIWebView *webView;

@end

@implementation H5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SY_WIDTH, SY_HEIGHT)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_h5Str]];
    [self.view addSubview: self.webView];
    [self.webView loadRequest:request];
    [self navSet];
}

#pragma mark -- private mark

- (void) navSet
{
    [self.navigationController.navigationBar setHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;  //启用侧滑手势
 
}

@end
