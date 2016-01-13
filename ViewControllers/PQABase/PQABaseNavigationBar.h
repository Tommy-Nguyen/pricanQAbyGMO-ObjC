//
//  PQABaseNavigationBar.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/13/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQABaseNavigationBar : UIView

@property (weak, nonatomic) IBOutlet UIButton *rightBar;

- (void)setUpRightBar;
@end
