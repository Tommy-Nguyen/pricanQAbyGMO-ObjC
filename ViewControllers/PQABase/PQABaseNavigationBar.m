//
//  PQABaseNavigationBar.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "PQABaseNavigationBar.h"

@implementation PQABaseNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUpRightBar {
    self.rightBar = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBar setBackgroundImage:[UIImage imageNamed:@"RightMenuBar"] forState:UIControlStateNormal];
    [self.rightBar setFrame:CGRectMake(0.0, 0.0, 40.0, 40.0)];
}

@end
