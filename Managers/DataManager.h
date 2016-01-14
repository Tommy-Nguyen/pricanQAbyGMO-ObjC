//
//  DataManager.h
//  pricanQAbyGMO-ObjC
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface DataManager : NSObject

@property (strong, nonatomic) MBProgressHUD *progressView;

+ (instancetype)sharedManager;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
