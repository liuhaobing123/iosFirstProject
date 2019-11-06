//
//  LearnTableHeadrView.m
//  StudentDemo10.21
//
//  Created by Haobing Liu on 2019/10/28.
//  Copyright © 2019 Haobing Liu. All rights reserved.
//

#import "LearnTableHeadrView.h"



@interface LearnTableHeadrView()

@end

@implementation LearnTabHeaderView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, scrollBoundWidth, scrollBoundHeight);
}


@end
