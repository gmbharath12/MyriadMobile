//
//  KDActivityView.m
//  Kingdom
//
//  Created by Bharath G M on 3/17/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import "KDActivityView.h"

@implementation KDActivityView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    self.borderView.layer.cornerRadius = 5;
    self.borderView.layer.borderColor= [UIColor darkGrayColor].CGColor;
    self.borderView.layer.borderWidth=2;
}
@end
