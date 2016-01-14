//
//  DataManager.m
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (instancetype)sharedManager {
    static DataManager *__sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedManager = [[DataManager alloc]init];
    });
    
    return __sharedManager;
}

- (MBProgressHUD *)progressView {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (!_progressView) {
        _progressView = [[MBProgressHUD alloc] initWithView:appDelegate.window];
        _progressView.animationType = MBProgressHUDAnimationFade;
        _progressView.dimBackground = NO;
        
        [appDelegate.window addSubview:_progressView];
    }
    return _progressView;
}

- (void)showLoadingView {
    [self hideLoadingView];
    [self showLoadingViewWithTitle:@"Loading..."];
}

- (void)showLoadingViewWithTitle:(NSString *)title
{
    [self hideLoadingView];
    self.progressView.labelText = title;
    [self.progressView show:YES];
    [self.progressView hide:YES afterDelay:kTimeoutDefault];
}

- (void)hideLoadingView {
    [self.progressView hide:NO];
}

@end
