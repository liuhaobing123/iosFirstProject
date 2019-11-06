//
//  TableGesVc.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/26.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "TableGesVc.h"

@interface TableGesVc ()

@end

@implementation TableGesVc

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
